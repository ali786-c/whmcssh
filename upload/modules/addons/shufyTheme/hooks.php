<?php
/**
 * ShufyTheme Standalone Engine Hooks
 * Auto-Active & Unencrypted - Integrates with Coodiv Control Panel & Database
 */

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

use WHMCS\Database\Capsule;

function shufyTheme_get_all_settings_db() {
    $settings = [];
    try {
        $rows = Capsule::table('tbladdonmodules')
            ->where('module', 'shufyTheme')
            ->get();
        foreach ($rows as $row) {
            $settings[$row->setting] = $row->value;
        }
    } catch (\Exception $e) {
        // Fallback
    }
    return $settings;
}

add_hook('ClientAreaPage', 1, function($vars) {
    $template = $vars['template'] ?? 'shufytheme';
    $dbSettings = shufyTheme_get_all_settings_db();

    // Default configuration mapping
    $defaults = [
        'shuffythemeversion' => '1.3.2',
        'shuffythemedirection' => "templates/{$template}/includes/theme-core/header-layouts/header-default-layout.tpl",
        'shuffythemedirectionfooter' => "templates/{$template}/includes/theme-core/footer-layouts/footer-default-layout.tpl",
        'coodivsettings' => array_merge([
            'id' => '1',
            'customthemeloader' => 'loaderdisbaled',
            'userdropdown' => 'activated',
            'cartdropdown' => 'activated',
            'notificationdropdown' => 'activated',
            'customersnotifications' => '',
            'gravatar' => 'activated'
        ], $dbSettings),
        'coodivcolorsettings' => array_merge([
            'id' => '1',
            'allowdarkmode' => 'activated',
            'darkmodefault' => '',
            'dafaultthemecolor' => 'default-color'
        ], $dbSettings),
        'coodivsidebaroptions' => array_merge([
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
        ], $dbSettings),
        'coodivlayoutssettings' => array_merge([
            'id' => '1',
            'layoutsettingssidebarlayout' => 'minimalist__sidebar',
            'layoutsettingssidebarposition' => 'sidebarpositionleft',
            'layoutsettingssidebarstyle' => 'sidebarheaderlogo'
        ], $dbSettings),
        'coodivhomepagesettings' => array_merge([
            'id' => '1',
            'themehomepagesettingmarketconnectbannaers' => 'activated',
            'themehomepagesettingmarketconnectbannaersnav' => 'activated',
            'themehomepagesettinghomepagefeaturedsection' => 'activated',
            'themehomepagesettingservicesfeatures' => 'activated',
            'themehomepagesettingannouncements' => 'activated',
            'themehomepagesettingsavingbanner' => 'activated',
            'themehomepagesettingsubscribingsection' => 'activated'
        ], $dbSettings),
        'coodivtypographiesettings' => array_merge([
            'id' => '1'
        ], $dbSettings),
        'CoodivMarketConnectServices' => [
            ['name' => 'sitebuilder', 'productGroup' => ['slug' => 'website-builder']],
            ['name' => 'codeguard', 'productGroup' => ['slug' => 'codeguard']],
            ['name' => 'sitelock', 'productGroup' => ['slug' => 'sitelock']],
            ['name' => 'spamexperts', 'productGroup' => ['slug' => 'spamexperts']],
            ['name' => 'marketgoo', 'productGroup' => ['slug' => 'marketgoo']],
            ['name' => 'weebly', 'productGroup' => ['slug' => 'weebly']]
        ]
    ];

    return $defaults;
});

add_hook('ClientAreaPrimaryNavbar', 1, function($primaryNavbar) {
    if (!is_null($primaryNavbar->getChild('Home'))) {
        $primaryNavbar->getChild('Home')->setUri('https://cloudhoste.eu');
    }
    foreach ($primaryNavbar->getChildren() as $child) {
        if (strtolower($child->getName()) === 'home' || strtolower($child->getLabel()) === 'home') {
            $child->setUri('https://cloudhoste.eu');
        }
    }
});

add_hook('ClientAreaPage', 10, function($vars) {
    if (($vars['templatefile'] ?? '') === 'homepage') {
        $activeGroups = [];
        try {
            $groups = \WHMCS\Product\Group::where('hidden', 0)->orderBy('order', 'asc')->get();
            $colors = ['color__one', 'color__two', 'color__tree', 'color__four'];
            $icons = ['fab fa-wordpress-simple', 'fal fa-database', 'fab fa-windows', 'fal fa-server'];
            $index = 0;
            foreach ($groups as $group) {
                $firstProduct = $group->products()->where('hidden', 0)->first();
                $minPrice = $firstProduct ? $firstProduct->pricing()->minprice() : null;
                $priceFormatted = $minPrice ? $minPrice->toPrefixed() : '';
                
                $activeGroups[] = [
                    'id' => $group->id,
                    'name' => $group->name,
                    'headline' => $group->headline ?: $group->name,
                    'tagline' => $group->tagline ?: 'Optimized for speed, reliability, and security.',
                    'slug' => $group->slug,
                    'url' => "{$vars['WEB_ROOT']}/cart.php?gid={$group->id}",
                    'price' => $priceFormatted ? "From {$priceFormatted}" : '',
                    'color_class' => $colors[$index % count($colors)],
                    'icon' => $icons[$index % count($icons)],
                ];
                $index++;
            }
        } catch (\Exception $e) {
            // Fallback gracefully
        }
        return ['activeProductGroups' => $activeGroups];
    }
});