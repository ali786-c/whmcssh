<?php
/**
 * ShufyTheme Standalone Engine Hooks
 * Dynamically loads settings saved from the Control Panel in WHMCS Admin
 */

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

use WHMCS\Database\Capsule;

add_hook('ClientAreaPage', 1, function($vars) {
    $template = $vars['template'] ?? 'shufytheme';

    // Helper to get saved DB setting with default fallback
    $getSetting = function($key, $default) {
        try {
            $row = Capsule::table('tbladdonmodules')
                ->where('module', 'shufyTheme')
                ->where('setting', $key)
                ->first();
            return ($row && !empty($row->value)) ? $row->value : $default;
        } catch (\Exception $e) {
            return $default;
        }
    };

    return [
        'shuffythemeversion' => '1.3.2',
        'shuffythemedirection' => "templates/{$template}/includes/theme-core/header-layouts/header-default-layout.tpl",
        'shuffythemedirectionfooter' => "templates/{$template}/includes/theme-core/footer-layouts/footer-default-layout.tpl",
        'coodivsettings' => [
            'id' => '1',
            'customthemeloader' => $getSetting('custom_loader', 'loaderdisbaled'),
            'userdropdown' => $getSetting('user_dropdown', 'activated'),
            'cartdropdown' => $getSetting('cart_dropdown', 'activated'),
            'notificationdropdown' => $getSetting('notification_dropdown', 'activated'),
            'customersnotifications' => '',
            'gravatar' => 'activated'
        ],
        'coodivcolorsettings' => [
            'id' => '1',
            'allowdarkmode' => $getSetting('allow_dark_mode', 'activated'),
            'darkmodefault' => $getSetting('default_dark_mode', ''),
            'dafaultthemecolor' => $getSetting('theme_color', 'default-color')
        ],
        'coodivsidebaroptions' => [
            'id' => '1',
            'themesidebarsettingsfixedtopheader' => $getSetting('fixed_top_header', 'activated'),
            'themesidebarsettingsfixedhorizontalmenu' => $getSetting('fixed_horizontal_menu', 'activated'),
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
            'layoutsettingssidebarlayout' => $getSetting('sidebar_layout', 'minimalist__sidebar'),
            'layoutsettingssidebarposition' => $getSetting('sidebar_position', 'sidebarpositionleft'),
            'layoutsettingssidebarstyle' => $getSetting('sidebar_style', 'sidebarheaderlogo')
        ],
        'coodivhomepagesettings' => [
            'id' => '1',
            'themehomepagesettingmarketconnectbannaers' => $getSetting('hp_mc_banners', 'activated'),
            'themehomepagesettingmarketconnectbannaersnav' => $getSetting('hp_mc_banners_nav', 'activated'),
            'themehomepagesettinghomepagefeaturedsection' => $getSetting('hp_products', 'activated'),
            'themehomepagesettingservicesfeatures' => $getSetting('hp_features', 'activated'),
            'themehomepagesettingannouncements' => $getSetting('hp_announcements', 'activated'),
            'themehomepagesettingsavingbanner' => $getSetting('hp_saving_banner', 'activated'),
            'themehomepagesettingsubscribingsection' => $getSetting('hp_subscribe', 'activated')
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