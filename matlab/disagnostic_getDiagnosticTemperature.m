function [errNo, temperature] = disagnostic_getDiagnosticTemperature(tcp, axis)
% brief : Returns the current axis temperature
%
% param[in] tcp : TCP/IP connection ID
%           axis:  [0|1|2]
% param[out]
%           errNo: errNo
%           temperature: temperature


data_send = sprintf('{"jsonrpc": "2.0", "method": "com.attocube.amc.disagnostic.getDiagnosticTemperature", "params": [%i], "id": 1, "api": 2}', axis);

fprintf(tcp, data_send);
data_receive = fscanf(tcp);
data = jsondecode(data_receive);

errNo = data.result (1);
temperature = data.result (2);


end


