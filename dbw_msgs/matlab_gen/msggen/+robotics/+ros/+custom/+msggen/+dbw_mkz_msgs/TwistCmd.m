classdef TwistCmd < robotics.ros.Message
    %TwistCmd MATLAB implementation of dbw_mkz_msgs/TwistCmd
    %   This class was automatically generated by
    %   robotics.ros.msg.internal.gen.MessageClassGenerator.
    
    %   Copyright 2017 The MathWorks, Inc.
    
    %#ok<*INUSD>
    
    properties (Constant)
        MessageType = 'dbw_mkz_msgs/TwistCmd' % The ROS message type
    end
    
    properties (Constant, Hidden)
        MD5Checksum = 'ef873397d04f1a8acdfa4bcab4392286' % The MD5 Checksum of the message definition
    end
    
    properties (Access = protected)
        JavaMessage % The Java message object
    end
    
    properties (Constant, Access = protected)
        GeometryMsgsTwistClass = robotics.ros.msg.internal.MessageFactory.getClassForType('geometry_msgs/Twist') % Dispatch to MATLAB class for message type geometry_msgs/Twist
    end
    
    properties (Dependent)
        Twist
        AccelLimit
        DecelLimit
    end
    
    properties (Access = protected)
        Cache = struct('Twist', []) % The cache for fast data access
    end
    
    properties (Constant, Hidden)
        PropertyList = {'AccelLimit', 'DecelLimit', 'Twist'} % List of non-constant message properties
        ROSPropertyList = {'accel_limit', 'decel_limit', 'twist'} % List of non-constant ROS message properties
    end
    
    methods
        function obj = TwistCmd(msg)
            %TwistCmd Construct the message object TwistCmd
            import com.mathworks.toolbox.robotics.ros.message.MessageInfo;
            
            % Support default constructor
            if nargin == 0
                obj.JavaMessage = obj.createNewJavaMessage;
                return;
            end
            
            % Construct appropriate empty array
            if isempty(msg)
                obj = obj.empty(0,1);
                return;
            end
            
            % Make scalar construction fast
            if isscalar(msg)
                % Check for correct input class
                if ~MessageInfo.compareTypes(msg(1), obj.MessageType)
                    error(message('robotics:ros:message:NoTypeMatch', obj.MessageType, ...
                        char(MessageInfo.getType(msg(1))) ));
                end
                obj.JavaMessage = msg(1);
                return;
            end
            
            % Check that this is a vector of scalar messages. Since this
            % is an object array, use arrayfun to verify.
            if ~all(arrayfun(@isscalar, msg))
                error(message('robotics:ros:message:MessageArraySizeError'));
            end
            
            % Check that all messages in the array have the correct type
            if ~all(arrayfun(@(x) MessageInfo.compareTypes(x, obj.MessageType), msg))
                error(message('robotics:ros:message:NoTypeMatchArray', obj.MessageType));
            end
            
            % Construct array of objects if necessary
            objType = class(obj);
            for i = 1:length(msg)
                obj(i,1) = feval(objType, msg(i)); %#ok<AGROW>
            end
        end
        
        function twist = get.Twist(obj)
            %get.Twist Get the value for property Twist
            if isempty(obj.Cache.Twist)
                obj.Cache.Twist = feval(obj.GeometryMsgsTwistClass, obj.JavaMessage.getTwist);
            end
            twist = obj.Cache.Twist;
        end
        
        function set.Twist(obj, twist)
            %set.Twist Set the value for property Twist
            validateattributes(twist, {obj.GeometryMsgsTwistClass}, {'nonempty', 'scalar'}, 'TwistCmd', 'Twist');
            
            obj.JavaMessage.setTwist(twist.getJavaObject);
            
            % Update cache if necessary
            if ~isempty(obj.Cache.Twist)
                obj.Cache.Twist.setJavaObject(twist.getJavaObject);
            end
        end
        
        function accellimit = get.AccelLimit(obj)
            %get.AccelLimit Get the value for property AccelLimit
            accellimit = single(obj.JavaMessage.getAccelLimit);
        end
        
        function set.AccelLimit(obj, accellimit)
            %set.AccelLimit Set the value for property AccelLimit
            validateattributes(accellimit, {'numeric'}, {'nonempty', 'scalar'}, 'TwistCmd', 'AccelLimit');
            
            obj.JavaMessage.setAccelLimit(accellimit);
        end
        
        function decellimit = get.DecelLimit(obj)
            %get.DecelLimit Get the value for property DecelLimit
            decellimit = single(obj.JavaMessage.getDecelLimit);
        end
        
        function set.DecelLimit(obj, decellimit)
            %set.DecelLimit Set the value for property DecelLimit
            validateattributes(decellimit, {'numeric'}, {'nonempty', 'scalar'}, 'TwistCmd', 'DecelLimit');
            
            obj.JavaMessage.setDecelLimit(decellimit);
        end
    end
    
    methods (Access = protected)
        function resetCache(obj)
            %resetCache Resets any cached properties
            obj.Cache.Twist = [];
        end
        
        function cpObj = copyElement(obj)
            %copyElement Implements deep copy behavior for message
            
            % Call default copy method for shallow copy
            cpObj = copyElement@robotics.ros.Message(obj);
            
            % Clear any existing cached properties
            cpObj.resetCache;
            
            % Create a new Java message object
            cpObj.JavaMessage = obj.createNewJavaMessage;
            
            % Iterate over all primitive properties
            cpObj.AccelLimit = obj.AccelLimit;
            cpObj.DecelLimit = obj.DecelLimit;
            
            % Recursively copy compound properties
            cpObj.Twist = copy(obj.Twist);
        end
        
        function reload(obj, strObj)
            %reload Called by loadobj to assign properties
            obj.AccelLimit = strObj.AccelLimit;
            obj.DecelLimit = strObj.DecelLimit;
            obj.Twist = feval([obj.GeometryMsgsTwistClass '.loadobj'], strObj.Twist);
        end
    end
    
    methods (Access = ?robotics.ros.Message)
        function strObj = saveobj(obj)
            %saveobj Implements saving of message to MAT file
            
            % Return an empty element if object array is empty
            if isempty(obj)
                strObj = struct.empty;
                return
            end
            
            strObj.AccelLimit = obj.AccelLimit;
            strObj.DecelLimit = obj.DecelLimit;
            strObj.Twist = saveobj(obj.Twist);
        end
    end
    
    methods (Static, Access = {?matlab.unittest.TestCase, ?robotics.ros.Message})
        function obj = loadobj(strObj)
            %loadobj Implements loading of message from MAT file
            
            % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = robotics.ros.custom.msggen.dbw_mkz_msgs.TwistCmd.empty(0,1);
                return
            end
            
            % Create an empty message object
            obj = robotics.ros.custom.msggen.dbw_mkz_msgs.TwistCmd;
            obj.reload(strObj);
        end
    end
end