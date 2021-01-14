function [errNo] = move_writeNSteps(tcp, axis, step)
% brief : set N steps
%
% param[in] tcp : TCP/IP connection ID
%           axis:  [0|1|2]
%           step:  number of step
% param[out]
%           errNo: errNo


data_send = sprintf('{"jsonrpc": "2.0", "method": "com.attocube.amc.move.writeNSteps", "params": [%i, %i], "id": 1, "api": 2}', axis, step);

fprintf(tcp, data_send);
data_receive = fscanf(tcp);
data = jsondecode(data_receive);

errNo = data.result (1);


end


