if not(evalin('base','zef.lock_sensor_names_on'))

if ismember(evalin('base',['size(zef.' zef.current_sensors '_points,2)']),[6,0])
evalin('base',['zef.' zef.current_sensors '_points = [zef.' zef.current_sensors '_points; [0 0 0 0 1 ' num2str(evalin('base','zef.default_impedance_value')) ' ]];']);
else
evalin('base',['zef.' zef.current_sensors '_points = [zef.' zef.current_sensors '_points; [0 0 0]];']);
end

if ismember(evalin('base',['zef.' zef.current_sensors '_imaging_method_name']),{'MEG magnetometers','MEG gradiometers'})

if evalin('base',['size(zef.' zef.current_sensors '_directions,2)']) == 6
evalin('base',['zef.' zef.current_sensors '_directions = [zef.' zef.current_sensors '_directions; [0 0 0 0 0 0]];']);
else
evalin('base',['zef.' zef.current_sensors '_directions = [zef.' zef.current_sensors '_directions; [0 0 0]];']);
end

end

zef_init_sensors_name_table;

    end