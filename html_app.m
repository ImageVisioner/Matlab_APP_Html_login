classdef html_app < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure  matlab.ui.Figure
        HTML_2    matlab.ui.control.HTML
        Label     matlab.ui.control.Label
        HTML      matlab.ui.control.HTML
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Data changed function: HTML
        function HTMLDataChanged(app, event)
            data = app.HTML.Data;
%             登录界面

%   问题： 请问登录和密码都用html做  应该怎么做？
            data=string(data);
            if data== "123"
                delete(app.UIFigure)
                run app2.mlapp
            else
                msgbox("你不是一个好鸭子")
                return ;
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 617 368];
            app.UIFigure.Name = 'MATLAB App';

            % Create HTML
            app.HTML = uihtml(app.UIFigure);
            app.HTML.HTMLSource = 'passwordEdit.html';
            app.HTML.DataChangedFcn = createCallbackFcn(app, @HTMLDataChanged, true);
            app.HTML.Position = [45 242 397 30];

            % Create Label
            app.Label = uilabel(app.UIFigure);
            app.Label.FontSize = 24;
            app.Label.FontWeight = 'bold';
            app.Label.FontColor = [1 0.4118 0.1608];
            app.Label.Position = [91 293 304 31];
            app.Label.Text = '小刘鸭王交流群登录器';

            % Create HTML_2
            app.HTML_2 = uihtml(app.UIFigure);
            app.HTML_2.HTMLSource = 'passwordEdit.html';
            app.HTML_2.Position = [46 122 397 30];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = html_app

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end