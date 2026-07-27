<?php
/**
 * ShufyTheme Standalone Engine Hooks
 * Replaces ionCube license checks with permanent Active status
 */

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

add_hook('ClientAreaPage', 1, function($vars) {
    $template = $vars['template'] ?? 'shufytheme';
    
    return [
        'shuffythemeversion' => '1.3.2',
        'shuffythemedirection' => "templates/{$template}/includes/theme-core/header-layouts/header-default-layout.tpl",
        'shuffythemedirectionfooter' => "templates/{$template}/includes/theme-core/footer-layouts/footer-default-layout.tpl",
        'coodivsettings' => [
            'id' => '1',
            'customthemeloader' => 'loaderdisbaled',
            'userdropdown' => 'activated',
            'cartdropdown' => 'activated',
            'notificationdropdown' => 'activated',
            'customersnotifications' => '',
            'gravatar' => 'activated'
        ],
        'coodivcolorsettings' => [
            'id' => '1',
            'allowdarkmode' => 'activated',
            'darkmodefault' => '',
            'dafaultthemecolor' => 'default-color'
        ],
        'coodivsidebaroptions' => [
            'id' => '1',
            'themesidebarsettingsfixedtopheader' => 'activated',
            'themesidebarsettingsfixedhorizontalmenu' => 'activated',
            'themesidebarsettingsfixedsecondarymenu' => 'activated',
            'themesidebarsettingssidebaronhover' => 'activated',
            'themesidebarsettingschildonhover' => 'activated',
            'themesidebarsettingsdarkicons' => '',
            'themesidebarsettingswithouticons' => '',
            'themesidebarsettingfullwidthtopheader' => 'activated',
            'themesidebarsettingfullwithhorizontalmenu' => 'activated',
            'themesidebarsettingsdarkmode' => '',
            'themesidebarsettingsallowusertoexpend' => 'activated',
            'themesidebarsettingsallowusertocollapse' => 'activated',
            'themesidebarsettingscollapsed' => ''
        ],
        'coodivlayoutssettings' => [
            'id' => '1',
            'layoutsettingssidebarlayout' => 'minimalist__sidebar',
            'layoutsettingssidebarposition' => 'sidebarpositionleft',
            'layoutsettingssidebarstyle' => 'sidebarheaderlogo'
        ],
        'coodivhomepagesettings' => [
            'id' => '1',
            'themehomepagesettingmarketconnectbannaers' => 'activated',
            'themehomepagesettingmarketconnectbannaersnav' => 'activated',
            'themehomepagesettinghomepagefeaturedsection' => 'activated',
            'themehomepagesettingservicesfeatures' => 'activated',
            'themehomepagesettingannouncements' => 'activated',
            'themehomepagesettingsavingbanner' => 'activated',
            'themehomepagesettingsubscribingsection' => 'activated'
        ],
        'CoodivMarketConnectServices' => [
            ['name' => 'sitebuilder', 'productGroup' => ['slug' => 'website-builder']],
            ['name' => 'codeguard', 'productGroup' => ['slug' => 'codeguard']],
            ['name' => 'sitelock', 'productGroup' => ['slug' => 'sitelock']],
            ['name' => 'spamexperts', 'productGroup' => ['slug' => 'spamexperts']],
            ['name' => 'marketgoo', 'productGroup' => ['slug' => 'marketgoo']],
            ['name' => 'weebly', 'productGroup' => ['slug' => 'weebly']]
        ]
    ];
});