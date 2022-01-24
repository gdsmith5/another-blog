%% Script to build linear regression model for correction of PurpleAir measurements in Athens, GA
% This script starts with a timetable called "PA_TT_all"
% that contains PurpleAir sensor and regulatory instrument measurements of
% aerosol concentration in the Athens, GA area.

%% Split PA_TT up by sensor
% Re-cast timetable so that each row contains measurements from just a
% single PA sensor and the regulatory monitor

PA_TT_new = timetable;
for i = 1:2:width(PA_TT_all)-1
    temp_TT = PA_TT_all(:,[i,i+1,end]);
    temp_TT.Properties.VariableNames = {'A','B','PM_ref'};
    PA_TT_new = [PA_TT_new; temp_TT];
end

%% Shift timezone to New York
% Timestamps shifted from UTC to Eastern ("New_York")

PA_TT_new.Time.TimeZone = 'Etc/UTC';
PA_TT_new.Time.TimeZone = 'America/New_York';

%% Remove any rows with NaN
% Remove samples with missing values 

PA_TT_new = rmmissing(PA_TT_new);

%% Remove any rows with bad A/B agreement
% Each PA sensor contains two channels, "A" and "B".
% Use redundancy to identify suspect samples for which "A" and "B"
% disagree by more than 30%

ratio = PA_TT_new.A ./ PA_TT_new.B;
flag = ratio > 1.3 | ratio < 1/1.3;
sum(flag);

PA_TT_new(flag,:) = [];
clearvars ratio flag;

%% Split into training and test datasets
% Take cleaned data and split into training and test sets.
% Note that random partitioning into sets would not be a good idea
% because samples close in time can be correlated.
% Test: 1/1/21 - 8/31/21
% Train: 9/1/21 - 10/31/21

PA_TT_new.Time.TimeZone = '';
flag = PA_TT_new.Time > datetime(2020,12,31) & PA_TT_new.Time < datetime(2021,9,1);
PA_TT_train = timetable2table(PA_TT_new(flag,:),'ConvertRowTimes',false);
PA_TT_test = timetable2table(PA_TT_new(~flag,:),'ConvertRowTimes',false);

clearvars flag;

%% Train Linear Model
% Use 5-fold cross validation to assess model performance,
% both RMSE (root-mean square error) and MAE (mean absolute error).
% Also calculate RMSE and MAE for test ("predicted") data.

CV = cvpartition(height(PA_TT_train),"KFold",5);

% 5-fold cross validation
CVMdl_linear = fitrlinear(PA_TT_train,'PM_ref','CVPartition',CV,'Learner','leastsquares');
RMSECV = sqrt(kfoldLoss(CVMdl_linear));
y_pred = kfoldPredict(CVMdl_linear);
MAE_CV = mean(abs(y_pred - PA_TT_train.PM_ref));

Mdl_linear = fitrlinear(PA_TT_train,'PM_ref','Learner','leastsquares');
y_pred = predict(Mdl_linear,PA_TT_test);
RMSEP = sqrt(sum((y_pred-PA_TT_test.PM_ref).^2)/height(y_pred));
MAE_P = mean(abs(y_pred - PA_TT_test.PM_ref));

%% Compare to LRAPA Model
% Calculate same figures of merit as above for a commonly-used correction
% model, the "LRAPA" model:
% (https://www.lrapa.org/DocumentCenter/View/4147/PurpleAir-Correction-Summary).

y_pred = LRAPA_correct(mean(PA_TT_train{:,1:2},2));
RMSECV(2) = sqrt(sum((y_pred-PA_TT_train.PM_ref).^2)/height(y_pred));
MAE_CV(2) = mean(abs(y_pred - PA_TT_train.PM_ref));

y_pred = LRAPA_correct(mean(PA_TT_test{:,1:2},2));
RMSEP(2) = sqrt(sum((y_pred-PA_TT_test.PM_ref).^2)/height(y_pred));
MAE_P(2) = mean(abs(y_pred - PA_TT_test.PM_ref));


%% function to apply LRAPA correction to PA data
% uses PM2.5 from PA using CF=ATM as data_PA
function PA_LRAPA = LRAPA_correct(X)
    data_PA = X;
    PA_LRAPA = data_PA*0.5 - 0.66;
end


