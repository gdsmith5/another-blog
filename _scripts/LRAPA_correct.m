%% function to apply LRAPA correction to PA data
% uses PM2.5 from PA using CF=ATM as data_PA
function PA_LRAPA = LRAPA_correct(X)
    data_PA = X;
    PA_LRAPA = data_PA*0.5 - 0.66;
end