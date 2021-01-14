function [errNo] = move_setGroundAxisAutoOnTarget(tcp, axis, enabled)
% brief : Pull axis piezo drive to GND if positioner is in ground target range
%            ONLY DUMMY RIGHT NOW
%            only in AMC300
%            this is used in MIC-Mode
%
% param[in] tcp : TCP/IP connection ID
%           axis:  montion controler axis [0|1|2]
%           enabled:  true or false
% param[out]
%           errNo: errNo 0 or error


data_send = sprintf('{"jsonrpc": "2.0", "method": "com.attocube.amc.move.setGroundAxisAutoOnTarget", "params": [%i, %i], "id": 1, "api": 2}', axis, enabled);

fprintf(tcp, data_send);
data_receive = fscanf(tcp);
data = jsondecode(data_receive);

errNo = data.result (1);


end


