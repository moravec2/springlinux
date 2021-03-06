require '/home/live/.config/obmenu-generator/config.pl';

our $SCHEMA = [
    {sep => 'Springlinux'},
    #             COMMAND                 LABEL                ICON
    {item => ['spacefm',           'File Manager',      'file-manager']},
    {item => [$CONFIG->{terminal}, 'Terminal',          'terminal']},
    {item => [$CONFIG->{editor},   'Editor',            'text-editor']},
    {item => ['firefox',           'Web Browser',       'web-browser']},
    {item => ['~/.config/dmenu/dmenu-bind.sh',         'Run command',       'system-run']},

	{sep => undef},
        {item => ['lxterminal -e sudo springlinux-installer',     'Install',      '']},
    {sep => undef},

	{raw => q(<menu id="Applications" label="Applications">)},
		#          NAME            LABEL                ICON
		{cat => ['utility',     'Accessories', 'applications-utilities']},
		{cat => ['development', 'Development', 'applications-development']},
		{cat => ['education',   'Education',   'applications-science']},
		{cat => ['game',        'Games',       'applications-games']},
		{cat => ['graphics',    'Graphics',    'applications-graphics']},
		{cat => ['audiovideo',  'Multimedia',  'applications-multimedia']},
		{cat => ['network',     'Network',     'applications-internet']},
		{cat => ['office',      'Office',      'applications-office']},
		{cat => ['settings',    'Settings',    'applications-accessories']},
		{cat => ['system',      'System',      'applications-system']},
	{raw => q(</menu>)},

	{raw => q(<menu execute="~/.config/openbox/pipemenus/obpipemenu-places ~/" id="places" label="Places"/>)},
	{raw => q(<menu execute="~/.config/openbox/pipemenus/obrecent.sh ~/" id="recent" label="Recent Files"/>)},
	{raw => q(<menu execute="~/.config/openbox/pipemenus/fehpipe" id="fehback" label="Wallpapers"/>)},

        {raw => q(<menu id="Preferences" label="Preferences">)},
		{raw => q(<menu id="Screenshot" label="Take Screenshot">)},
			{raw => q(<item label="Now"><action name="Execute"><execute>scrot '%Y-%m-%d--%s_$wx$h_scrot.png' -e 'mv $f ~/ &amp; gpicview ~/$f'</execute></action></item>)},
			{raw => q(<item label="In 10 Seconds..."><action name="Execute"><execute>scrot -d 10 '%Y-%m-%d--%s_$wx$h_scrot.png' -e 'mv $f ~/ &amp; gpicview ~/$f'</execute></action></item>)},
			{raw => q(<item label="Selected Area... click &amp; drag mouse"><action name="Execute"><execute>scrot -s '%Y-%m-%d--%s_$wx$h_scrot.png' -e 'mv $f ~/ &amp; gpicview ~/$f'</execute></action></item>)},
		{raw => q(</menu>)},
#		{item => ['obkey',   'Edit Key Bindings',   undef]},
		{obgenmenu => 'Openbox Settings'},
       	{raw => q(</menu>)},
		
        {sep       => undef},
	{raw => q(<menu id="Exit" label="Exit">)},
		# This options uses the default OpenBox action "Exit"
		{exit => ['Exit', 'exit']},
		{item => ['sudo reboot', 'Reboot', undef]},
		{item => ['sudo poweroff', 'Shutdown', undef]},
	{raw => q(</menu>)},
]
