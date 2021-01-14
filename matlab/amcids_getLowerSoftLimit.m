function [errNo, limit] = amcids_getLowerSoftLimit(tcp, axis)
% brief : Gets the lower boundary of the soft limit protection.
%        This protection is needed if the IDS working range is smaller than the positioners travel range.
%        It is no hard limit, so, it is possible to overshoot it!
%
% param[in] tcp : TCP/IP connection ID
%           axis: 
%            Axis of the AMC to get the soft limit status from
% param[out]
%           errNo: int32
%            Error number if one occured, 0 in case of no error
%           limit: double
%            Lower boundary in pm


data_send = sprintf('{"jsonrpc": "2.0", "method": "com.attocube.amc.amcids.getLowerSoftLimit", "params": [%i], "id": 1, "api": 2}', axis);

fprintf(tcp, data_send);
data_receive = fscanf(tcp);
data = jsondecode(data_receive);

errNo = data.result (1);
limit = data.result (2);


end


