classdef CustomMsgConsts
    %CustomMsgConsts This class stores all message types
    %   The message types are constant properties, which in turn resolve
    %   to the strings of the actual types.
    
    %   Copyright 2017 The MathWorks, Inc.
    
    properties (Constant)
        dbw_mkz_msgs_AmbientLight = 'dbw_mkz_msgs/AmbientLight'
        dbw_mkz_msgs_BrakeCmd = 'dbw_mkz_msgs/BrakeCmd'
        dbw_mkz_msgs_BrakeInfoReport = 'dbw_mkz_msgs/BrakeInfoReport'
        dbw_mkz_msgs_BrakeReport = 'dbw_mkz_msgs/BrakeReport'
        dbw_mkz_msgs_FuelLevelReport = 'dbw_mkz_msgs/FuelLevelReport'
        dbw_mkz_msgs_Gear = 'dbw_mkz_msgs/Gear'
        dbw_mkz_msgs_GearCmd = 'dbw_mkz_msgs/GearCmd'
        dbw_mkz_msgs_GearReport = 'dbw_mkz_msgs/GearReport'
        dbw_mkz_msgs_HillStartAssist = 'dbw_mkz_msgs/HillStartAssist'
        dbw_mkz_msgs_Misc1Report = 'dbw_mkz_msgs/Misc1Report'
        dbw_mkz_msgs_ParkingBrake = 'dbw_mkz_msgs/ParkingBrake'
        dbw_mkz_msgs_SteeringCmd = 'dbw_mkz_msgs/SteeringCmd'
        dbw_mkz_msgs_SteeringReport = 'dbw_mkz_msgs/SteeringReport'
        dbw_mkz_msgs_SurroundReport = 'dbw_mkz_msgs/SurroundReport'
        dbw_mkz_msgs_SuspensionReport = 'dbw_mkz_msgs/SuspensionReport'
        dbw_mkz_msgs_ThrottleCmd = 'dbw_mkz_msgs/ThrottleCmd'
        dbw_mkz_msgs_ThrottleInfoReport = 'dbw_mkz_msgs/ThrottleInfoReport'
        dbw_mkz_msgs_ThrottleReport = 'dbw_mkz_msgs/ThrottleReport'
        dbw_mkz_msgs_TirePressureReport = 'dbw_mkz_msgs/TirePressureReport'
        dbw_mkz_msgs_TurnSignal = 'dbw_mkz_msgs/TurnSignal'
        dbw_mkz_msgs_TurnSignalCmd = 'dbw_mkz_msgs/TurnSignalCmd'
        dbw_mkz_msgs_TwistCmd = 'dbw_mkz_msgs/TwistCmd'
        dbw_mkz_msgs_WatchdogCounter = 'dbw_mkz_msgs/WatchdogCounter'
        dbw_mkz_msgs_WheelSpeedReport = 'dbw_mkz_msgs/WheelSpeedReport'
        dbw_mkz_msgs_Wiper = 'dbw_mkz_msgs/Wiper'
    end
    
    methods (Static, Hidden)
        function messageList = getMessageList
            %getMessageList Generate a cell array with all message types.
            %   The list will be sorted alphabetically.
            
            persistent msgList
            if isempty(msgList)
                msgList = cell(25, 1);
                msgList{1} = 'dbw_mkz_msgs/AmbientLight';
                msgList{2} = 'dbw_mkz_msgs/BrakeCmd';
                msgList{3} = 'dbw_mkz_msgs/BrakeInfoReport';
                msgList{4} = 'dbw_mkz_msgs/BrakeReport';
                msgList{5} = 'dbw_mkz_msgs/FuelLevelReport';
                msgList{6} = 'dbw_mkz_msgs/Gear';
                msgList{7} = 'dbw_mkz_msgs/GearCmd';
                msgList{8} = 'dbw_mkz_msgs/GearReport';
                msgList{9} = 'dbw_mkz_msgs/HillStartAssist';
                msgList{10} = 'dbw_mkz_msgs/Misc1Report';
                msgList{11} = 'dbw_mkz_msgs/ParkingBrake';
                msgList{12} = 'dbw_mkz_msgs/SteeringCmd';
                msgList{13} = 'dbw_mkz_msgs/SteeringReport';
                msgList{14} = 'dbw_mkz_msgs/SurroundReport';
                msgList{15} = 'dbw_mkz_msgs/SuspensionReport';
                msgList{16} = 'dbw_mkz_msgs/ThrottleCmd';
                msgList{17} = 'dbw_mkz_msgs/ThrottleInfoReport';
                msgList{18} = 'dbw_mkz_msgs/ThrottleReport';
                msgList{19} = 'dbw_mkz_msgs/TirePressureReport';
                msgList{20} = 'dbw_mkz_msgs/TurnSignal';
                msgList{21} = 'dbw_mkz_msgs/TurnSignalCmd';
                msgList{22} = 'dbw_mkz_msgs/TwistCmd';
                msgList{23} = 'dbw_mkz_msgs/WatchdogCounter';
                msgList{24} = 'dbw_mkz_msgs/WheelSpeedReport';
                msgList{25} = 'dbw_mkz_msgs/Wiper';
            end
            
            messageList = msgList;
        end
        
        function serviceList = getServiceList
            %getServiceList Generate a cell array with all service types.
            %   The list will be sorted alphabetically.
            
            persistent svcList
            if isempty(svcList)
                svcList = cell(0, 1);
            end
            
            % The message list was already sorted, so don't need to sort
            % again.
            serviceList = svcList;
        end
    end
end
