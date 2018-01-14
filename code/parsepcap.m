function parsedmap = parsepcap(paths, filtEmpty)
parsedmap = containers.Map;
filter = 'tcp';

if filtEmpty
    filter = [filter, ' and tcp.len != 0'];
end

if ~isempty(paths)
    temp = pcap2matlab(filter, {'ip.src';'ip.dst';'tcp.len';}, paths{1}, '');
end

if length(paths) > 1
    for i=2:length(paths)
        temp = [temp,  pcap2matlab(filter, {'ip.src';'ip.dst';'tcp.len';}, paths{1}, '')];
    end
end
    
for i=1:length(temp)
   pack = temp(i);
   index = [pack.ipsrc, ',', pack.ipdst];
   if ~isKey(parsedmap, {index})
     parsedmap(index) = [];   
   end
   parsedmap(index) = [parsedmap(index), pack.tcplen];
end



