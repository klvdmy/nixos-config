{ config, libs, pkgs, ... }:

let
  colors = import ../theme/colors.nix;
in
{
  home.packages = with pkgs; [
    rofi
  ];
  xdg.configFile = {
    "rofi/config.rasi".text = ''
      /**
       *
       * Author : Aditya Shakya (adi1090x)
       * Github : @adi1090x
       * 
       * Configuration For Rofi Version: 1.7.3
       **/

      configuration {
      	/*---------- General setting ----------*/
      	modi: "drun,run,filebrowser,window";
      	case-sensitive: false;
      	cycle: true;
      	filter: "";
      	scroll-method: 0;
      	normalize-match: true;
      	show-icons: true;
      	icon-theme: "Papirus";
      /*	cache-dir: ;*/
      	steal-focus: false;
      /*	dpi: -1;*/

      	/*---------- Matching setting ----------*/
      	matching: "normal";
      	tokenize: true;

      	/*---------- SSH settings ----------*/
      	ssh-client: "ssh";
      	ssh-command: "{terminal} -e {ssh-client} {host} [-p {port}]";
      	parse-hosts: true;
      	parse-known-hosts: true;

      	/*---------- Drun settings ----------*/
      	drun-categories: "";
      	drun-match-fields: "name,generic,exec,categories,keywords";
      	drun-display-format: "{name} [<span weight='light' size='small'><i>({generic})</i></span>]";
      	drun-show-actions: false;
      	drun-url-launcher: "xdg-open";
      	drun-use-desktop-cache: false;
      	drun-reload-desktop-cache: false;
      	drun {
      		/** Parse user desktop files. */
      		parse-user:   true;
      		/** Parse system desktop files. */
      		parse-system: true;
          }

      	/*---------- Run settings ----------*/
      	run-command: "{cmd}";
      	run-list-command: "";
      	run-shell-command: "{terminal} -e {cmd}";

      	/*---------- Fallback Icon ----------*/
      	run,drun {
      		fallback-icon: "application-x-addon";
      	}

      	/*---------- Window switcher settings ----------*/
      	window-match-fields: "title,class,role,name,desktop";
      	window-command: "wmctrl -i -R {window}";
      	window-format: "{w} - {c} - {t:0}";
      	window-thumbnail: false;

      	/*---------- Combi settings ----------*/
      /*	combi-modi: "window,run";*/
      /*	combi-hide-mode-prefix: false;*/
      /*	combi-display-format: "{mode} {text}";*/

      	/*---------- History and Sorting ----------*/
      	disable-history: false;
      	sorting-method: "normal";
      	max-history-size: 25;

      	/*---------- Display setting ----------*/
      	display-window: "Windows";
      	display-windowcd: "Window CD";
      	display-run: "Run";
      	display-ssh: "SSH";
      	display-drun: "Apps";
      	display-combi: "Combi";
      	display-keys: "Keys";
      	display-filebrowser: "Files";

      	/*---------- Misc setting ----------*/
      	terminal: "rofi-sensible-terminal";
      	font: "Mono 12";
      	sort: false;
      	threads: 0;
      	click-to-exit: true;
      /*	ignored-prefixes: "";*/
      /*	pid: "/run/user/1000/rofi.pid";*/

      	/*---------- File browser settings ----------*/
          filebrowser {
      /*	  directory: "/home";*/
            directories-first: true;
            sorting-method:    "name";
          }

      	/*---------- Other settings ----------*/
          timeout {
            action: "kb-cancel";
            delay:  0;
          }

      	/*---------- Keybindings ----------*/
      /*
      	kb-primary-paste: "Control+V,Shift+Insert";
      	kb-secondary-paste: "Control+v,Insert";
      	kb-clear-line: "Control+w";
      	kb-move-front: "Control+a";
      	kb-move-end: "Control+e";
      	kb-move-word-back: "Alt+b,Control+Left";
      	kb-move-word-forward: "Alt+f,Control+Right";
      	kb-move-char-back: "Left,Control+b";
      	kb-move-char-forward: "Right,Control+f";
      	kb-remove-word-back: "Control+Alt+h,Control+BackSpace";
      	kb-remove-word-forward: "Control+Alt+d";
      	kb-remove-char-forward: "Delete,Control+d";
      	kb-remove-char-back: "BackSpace,Shift+BackSpace,Control+h";
      	kb-remove-to-eol: "Control+k";
      	kb-remove-to-sol: "Control+u";
      	kb-accept-entry: "Control+j,Control+m,Return,KP_Enter";
      	kb-accept-custom: "Control+Return";
      	kb-accept-custom-alt: "Control+Shift+Return";
      	kb-accept-alt: "Shift+Return";
      	kb-delete-entry: "Shift+Delete";
      	kb-mode-next: "Shift+Right,Control+Tab";
      	kb-mode-previous: "Shift+Left,Control+ISO_Left_Tab";
      	kb-mode-complete: "Control+l";
      	kb-row-left: "Control+Page_Up";
      	kb-row-right: "Control+Page_Down";
      	kb-row-down: "Down,Control+n";
      	kb-page-prev: "Page_Up";
      	kb-page-next: "Page_Down";
      	kb-row-first: "Home,KP_Home";
      	kb-row-last: "End,KP_End";
      	kb-row-select: "Control+space";
      	kb-screenshot: "Alt+S";
      	kb-ellipsize: "Alt+period";
      	kb-toggle-case-sensitivity: "grave,dead_grave";
      	kb-toggle-sort: "Alt+grave";
      	kb-cancel: "Escape,Control+g,Control+bracketleft";
      	kb-custom-1: "Alt+1";
      	kb-custom-2: "Alt+2";
      	kb-custom-3: "Alt+3";
      	kb-custom-4: "Alt+4";
      	kb-custom-5: "Alt+5";
      	kb-custom-6: "Alt+6";
      	kb-custom-7: "Alt+7";
      	kb-custom-8: "Alt+8";
      	kb-custom-9: "Alt+9";
      	kb-custom-10: "Alt+0";
      	kb-custom-11: "Alt+exclam";
      	kb-custom-12: "Alt+at";
      	kb-custom-13: "Alt+numbersign";
      	kb-custom-14: "Alt+dollar";
      	kb-custom-15: "Alt+percent";
      	kb-custom-16: "Alt+dead_circumflex";
      	kb-custom-17: "Alt+ampersand";
      	kb-custom-18: "Alt+asterisk";
      	kb-custom-19: "Alt+parenleft";
      	kb-select-1: "Super+1";
      	kb-select-2: "Super+2";
      	kb-select-3: "Super+3";
      	kb-select-4: "Super+4";
      	kb-select-5: "Super+5";
      	kb-select-6: "Super+6";
      	kb-select-7: "Super+7";
      	kb-select-8: "Super+8";
      	kb-select-9: "Super+9";
      	kb-select-10: "Super+0";
      	ml-row-left: "ScrollLeft";
      	ml-row-right: "ScrollRight";
      	ml-row-up: "ScrollUp";
      	ml-row-down: "ScrollDown";
      	me-select-entry: "MousePrimary";
      	me-accept-entry: "MouseDPrimary";
      	me-accept-custom: "Control+MouseDPrimary";
      */
      }
    '';
    "rofi/style.rasi".text = ''
      /**
       *
       * Author : Aditya Shakya (adi1090x)
       * Github : @adi1090x
       * 
       * Rofi Theme File
       * Rofi Version: 1.7.3
       **/

      /*****----- Configuration -----*****/
      configuration {
      	modi:                       "drun,run,filebrowser";
          show-icons:                 false;
          display-drun:               " Apps";
          display-run:                " Run";
          display-filebrowser:        " Files";
          display-window:             " Windows";
      	drun-display-format:        "{name} [<span weight='light' size='small'><i>({generic})</i></span>]";
      	window-format:              "{w} · {c} · {t}";
      }

      /*****----- Global Properties -----*****/
      * {
          background:     ${colors.background};
          background-alt: ${colors.background-alt};
          foreground:     ${colors.foreground};
          selected:       ${colors.primary};
          active:         #98C379FF;
          urgent:         #E06C75FF;
      }

      * {
          font: "JetBrains Mono 12";
      }

      * {
          border-colour:               var(selected);
          handle-colour:               var(selected);
          background-colour:           var(background);
          foreground-colour:           var(foreground);
          alternate-background:        var(background-alt);
          normal-background:           var(background);
          normal-foreground:           var(foreground);
          urgent-background:           var(urgent);
          urgent-foreground:           var(background);
          active-background:           var(active);
          active-foreground:           var(background);
          selected-normal-background:  var(selected);
          selected-normal-foreground:  var(background);
          selected-urgent-background:  var(active);
          selected-urgent-foreground:  var(background);
          selected-active-background:  var(urgent);
          selected-active-foreground:  var(background);
          alternate-normal-background: var(background);
          alternate-normal-foreground: var(foreground);
          alternate-urgent-background: var(urgent);
          alternate-urgent-foreground: var(background);
          alternate-active-background: var(active);
          alternate-active-foreground: var(background);
      }

      /*****----- Main Window -----*****/
      window {
          /* properties for window widget */
          transparency:                "real";
          location:                    center;
          anchor:                      center;
          fullscreen:                  false;
          width:                       800px;
          x-offset:                    0px;
          y-offset:                    0px;

          /* properties for all widgets */
          enabled:                     true;
          margin:                      0px;
          padding:                     0px;
          border:                      0px solid;
          border-radius:               20px;
          border-color:                @border-colour;
          cursor:                      "default";
          /* Backgroud Colors */
          background-color:            @background-colour;
          /* Backgroud Image */
          //background-image:          url("/path/to/image.png", none);
          /* Simple Linear Gradient */
          //background-image:          linear-gradient(red, orange, pink, purple);
          /* Directional Linear Gradient */
          //background-image:          linear-gradient(to bottom, pink, yellow, magenta);
          /* Angle Linear Gradient */
          //background-image:          linear-gradient(45, cyan, purple, indigo);
      }

      /*****----- Main Box -----*****/
      mainbox {
          enabled:                     true;
          spacing:                     10px;
          margin:                      0px;
          padding:                     40px;
          border:                      0px solid;
          border-radius:               0px 0px 0px 0px;
          border-color:                @border-colour;
          background-color:            transparent;
          children:                    [ "inputbar", "message", "listview", "mode-switcher" ];
      }

      /*****----- Inputbar -----*****/
      inputbar {
          enabled:                     true;
          spacing:                     10px;
          margin:                      0px;
          padding:                     0px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @border-colour;
          background-color:            transparent;
          text-color:                  @foreground-colour;
          children:                    [ "prompt", "textbox-prompt-colon", "entry" ];
      }

      prompt {
          enabled:                     true;
          background-color:            inherit;
          text-color:                  inherit;
      }
      textbox-prompt-colon {
          enabled:                     true;
          expand:                      false;
          str:                         "::";
          background-color:            inherit;
          text-color:                  inherit;
      }
      entry {
          enabled:                     true;
          background-color:            inherit;
          text-color:                  inherit;
          cursor:                      text;
          placeholder:                 "Search...";
          placeholder-color:           inherit;
      }
      num-filtered-rows {
          enabled:                     true;
          expand:                      false;
          background-color:            inherit;
          text-color:                  inherit;
      }
      textbox-num-sep {
          enabled:                     true;
          expand:                      false;
          str:                         "/";
          background-color:            inherit;
          text-color:                  inherit;
      }
      num-rows {
          enabled:                     true;
          expand:                      false;
          background-color:            inherit;
          text-color:                  inherit;
      }
      case-indicator {
          enabled:                     true;
          background-color:            inherit;
          text-color:                  inherit;
      }

      /*****----- Listview -----*****/
      listview {
          enabled:                     true;
          columns:                     2;
          lines:                       10;
          cycle:                       true;
          dynamic:                     true;
          scrollbar:                   true;
          layout:                      vertical;
          reverse:                     false;
          fixed-height:                true;
          fixed-columns:               true;
    
          spacing:                     5px;
          margin:                      0px;
          padding:                     0px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @border-colour;
          background-color:            transparent;
          text-color:                  @foreground-colour;
          cursor:                      "default";
      }
      scrollbar {
          handle-width:                10px ;
          handle-color:                @handle-colour;
          border-radius:               10px;
          background-color:            @alternate-background;
      }

      /*****----- Elements -----*****/
      element {
          enabled:                     true;
          spacing:                     10px;
          margin:                      0px;
          padding:                     5px 10px;
          border:                      0px solid;
          border-radius:               20px;
          border-color:                @border-colour;
          background-color:            transparent;
          text-color:                  @foreground-colour;
          cursor:                      pointer;
      }
      element normal.normal {
          background-color:            var(normal-background);
          text-color:                  var(normal-foreground);
      }
      element normal.urgent {
          background-color:            var(urgent-background);
          text-color:                  var(urgent-foreground);
      }
      element normal.active {
          background-color:            var(active-background);
          text-color:                  var(active-foreground);
      }
      element selected.normal {
          background-color:            var(selected-normal-background);
          text-color:                  var(selected-normal-foreground);
      }
      element selected.urgent {
          background-color:            var(selected-urgent-background);
          text-color:                  var(selected-urgent-foreground);
      }
      element selected.active {
          background-color:            var(selected-active-background);
          text-color:                  var(selected-active-foreground);
      }
      element alternate.normal {
          background-color:            var(alternate-normal-background);
          text-color:                  var(alternate-normal-foreground);
      }
      element alternate.urgent {
          background-color:            var(alternate-urgent-background);
          text-color:                  var(alternate-urgent-foreground);
      }
      element alternate.active {
          background-color:            var(alternate-active-background);
          text-color:                  var(alternate-active-foreground);
      }
      element-icon {
          background-color:            transparent;
          text-color:                  inherit;
          size:                        24px;
          cursor:                      inherit;
      }
      element-text {
          background-color:            transparent;
          text-color:                  inherit;
          highlight:                   inherit;
          cursor:                      inherit;
          vertical-align:              0.5;
          horizontal-align:            0.0;
      }

      /*****----- Mode Switcher -----*****/
      mode-switcher{
          enabled:                     true;
          spacing:                     10px;
          margin:                      0px;
          padding:                     0px;
          border:                      0px solid;
          border-radius:               0px;
          border-color:                @border-colour;
          background-color:            transparent;
          text-color:                  @foreground-colour;
      }
      button {
          padding:                     5px 10px;
          border:                      0px solid;
          border-radius:               20px;
          border-color:                @border-colour;
          background-color:            @alternate-background;
          text-color:                  inherit;
          cursor:                      pointer;
      }
      button selected {
          background-color:            var(selected-normal-background);
          text-color:                  var(selected-normal-foreground);
      }

      /*****----- Message -----*****/
      message {
          enabled:                     true;
          margin:                      0px;
          padding:                     0px;
          border:                      0px solid;
          border-radius:               0px 0px 0px 0px;
          border-color:                @border-colour;
          background-color:            transparent;
          text-color:                  @foreground-colour;
      }
      textbox {
          padding:                     5px 10px;
          border:                      0px solid;
          border-radius:               20px;
          border-color:                @border-colour;
          background-color:            @alternate-background;
          text-color:                  @foreground-colour;
          vertical-align:              0.5;
          horizontal-align:            0.0;
          highlight:                   none;
          placeholder-color:           @foreground-colour;
          blink:                       true;
          markup:                      true;
      }
      error-message {
          padding:                     10px;
          border:                      2px solid;
          border-radius:               20px;
          border-color:                @border-colour;
          background-color:            @background-colour;
          text-color:                  @foreground-colour;
      }
    '';
  };
}
