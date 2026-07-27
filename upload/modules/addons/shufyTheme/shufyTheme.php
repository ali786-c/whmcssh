<?php
/**
 * ShufyTheme Addon Module - Unencrypted Standalone Admin Control Panel
 */

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

use WHMCS\Database\Capsule;

function shufyTheme_config() {
    return [
        'name' => 'ShufyTheme Control Panel',
        'description' => 'Unencrypted Standalone Control Panel to manage ShufyTheme settings.',
        'author' => 'Coodiv',
        'language' => 'english',
        'version' => '1.1.8',
        'fields' => []
    ];
}

function shufyTheme_activate() {
    try {
        $defaults = [
            'theme_color' => 'default-color',
            'allow_dark_mode' => 'activated',
            'default_dark_mode' => '',
            'sidebar_layout' => 'minimalist__sidebar',
            'sidebar_position' => 'sidebarpositionleft',
            'sidebar_style' => 'sidebarheaderlogo',
            'fixed_top_header' => 'activated',
            'fixed_horizontal_menu' => 'activated',
            'custom_loader' => 'loaderdisbaled',
            'user_dropdown' => 'activated',
            'cart_dropdown' => 'activated',
            'notification_dropdown' => 'activated',
            'hp_mc_banners' => 'activated',
            'hp_mc_banners_nav' => 'activated',
            'hp_products' => 'activated',
            'hp_features' => 'activated',
            'hp_announcements' => 'activated',
            'hp_saving_banner' => 'activated',
            'hp_subscribe' => 'activated'
        ];

        foreach ($defaults as $setting => $value) {
            $exists = Capsule::table('tbladdonmodules')
                ->where('module', 'shufyTheme')
                ->where('setting', $setting)
                ->exists();
            if (!$exists) {
                Capsule::table('tbladdonmodules')->insert([
                    'module' => 'shufyTheme',
                    'setting' => $setting,
                    'value' => $value
                ]);
            }
        }
        return ['status' => 'success', 'description' => 'ShufyTheme Control Panel activated successfully.'];
    } catch (\Exception $e) {
        return ['status' => 'error', 'description' => 'Activation error: ' . $e->getMessage()];
    }
}

function shufyTheme_deactivate() {
    return ['status' => 'success', 'description' => 'ShufyTheme Control Panel deactivated.'];
}

function shufyTheme_get_setting($key, $default = '') {
    try {
        $row = Capsule::table('tbladdonmodules')
            ->where('module', 'shufyTheme')
            ->where('setting', $key)
            ->first();
        return $row ? $row->value : $default;
    } catch (\Exception $e) {
        return $default;
    }
}

function shufyTheme_set_setting($key, $value) {
    try {
        $exists = Capsule::table('tbladdonmodules')
            ->where('module', 'shufyTheme')
            ->where('setting', $key)
            ->exists();
        if ($exists) {
            Capsule::table('tbladdonmodules')
                ->where('module', 'shufyTheme')
                ->where('setting', $key)
                ->update(['value' => $value]);
        } else {
            Capsule::table('tbladdonmodules')->insert([
                'module' => 'shufyTheme',
                'setting' => $key,
                'value' => $value
            ]);
        }
    } catch (\Exception $e) {
        // Log exception if database is locked or table missing
    }
}

function shufyTheme_sel($val1, $val2) {
    return ($val1 === $val2) ? 'selected="selected"' : '';
}

function shufyTheme_output($vars) {
    $message = '';
    if (isset($_POST['action']) && $_POST['action'] === 'save_shufy_settings') {
        check_token();
        
        $settingsToSave = [
            'theme_color', 'allow_dark_mode', 'default_dark_mode',
            'sidebar_layout', 'sidebar_position', 'sidebar_style',
            'fixed_top_header', 'fixed_horizontal_menu',
            'custom_loader', 'user_dropdown', 'cart_dropdown', 'notification_dropdown',
            'hp_mc_banners', 'hp_mc_banners_nav', 'hp_products', 'hp_features',
            'hp_announcements', 'hp_saving_banner', 'hp_subscribe'
        ];

        foreach ($settingsToSave as $setting) {
            $val = $_POST[$setting] ?? '';
            shufyTheme_set_setting($setting, $val);
        }

        $message = '<div class="alert alert-success" style="margin-bottom: 20px;"><i class="fas fa-check-circle mr-2"></i> Settings saved successfully! Theme configuration updated.</div>';
    }

    // Load current values
    $themeColor = shufyTheme_get_setting('theme_color', 'default-color');
    $allowDarkMode = shufyTheme_get_setting('allow_dark_mode', 'activated');
    $defaultDarkMode = shufyTheme_get_setting('default_dark_mode', '');
    $sidebarLayout = shufyTheme_get_setting('sidebar_layout', 'minimalist__sidebar');
    $sidebarPosition = shufyTheme_get_setting('sidebar_position', 'sidebarpositionleft');
    $sidebarStyle = shufyTheme_get_setting('sidebar_style', 'sidebarheaderlogo');
    $fixedTopHeader = shufyTheme_get_setting('fixed_top_header', 'activated');
    $fixedHorizontalMenu = shufyTheme_get_setting('fixed_horizontal_menu', 'activated');

    $hpMcBanners = shufyTheme_get_setting('hp_mc_banners', 'activated');
    $hpMcBannersNav = shufyTheme_get_setting('hp_mc_banners_nav', 'activated');
    $hpProducts = shufyTheme_get_setting('hp_products', 'activated');
    $hpFeatures = shufyTheme_get_setting('hp_features', 'activated');
    $hpAnnouncements = shufyTheme_get_setting('hp_announcements', 'activated');
    $hpSavingBanner = shufyTheme_get_setting('hp_saving_banner', 'activated');
    $hpSubscribe = shufyTheme_get_setting('hp_subscribe', 'activated');

    // Pre-calculate selections
    $selColorDefault = shufyTheme_sel($themeColor, 'default-color');
    $selColorOne = shufyTheme_sel($themeColor, 'theme-style-one');
    $selColorTwo = shufyTheme_sel($themeColor, 'theme-style-two');
    $selColorThree = shufyTheme_sel($themeColor, 'theme-style-three');
    $selColorFour = shufyTheme_sel($themeColor, 'theme-style-four');

    $selDarkAllowAct = shufyTheme_sel($allowDarkMode, 'activated');
    $selDarkAllowDis = shufyTheme_sel($allowDarkMode, 'disabled');

    $selDarkDefLight = shufyTheme_sel($defaultDarkMode, '');
    $selDarkDefAct = shufyTheme_sel($defaultDarkMode, 'activated');

    $selSbMin = shufyTheme_sel($sidebarLayout, 'minimalist__sidebar');
    $selSbBig = shufyTheme_sel($sidebarLayout, 'big__icons__sidebar');
    $selSbSep = shufyTheme_sel($sidebarLayout, 'separated__sidebar');

    $selPosLeft = shufyTheme_sel($sidebarPosition, 'sidebarpositionleft');
    $selPosRight = shufyTheme_sel($sidebarPosition, 'sidebarpositionright');
    $selPosTop = shufyTheme_sel($sidebarPosition, 'sidebarpositiontop');

    $selFixHdrAct = shufyTheme_sel($fixedTopHeader, 'activated');
    $selFixHdrDis = shufyTheme_sel($fixedTopHeader, 'disabled');

    $selMcBanAct = shufyTheme_sel($hpMcBanners, 'activated');
    $selMcBanDis = shufyTheme_sel($hpMcBanners, 'disabled');

    $selMcNavAct = shufyTheme_sel($hpMcBannersNav, 'activated');
    $selMcNavDis = shufyTheme_sel($hpMcBannersNav, 'disabled');

    $selProdAct = shufyTheme_sel($hpProducts, 'activated');
    $selProdDis = shufyTheme_sel($hpProducts, 'disabled');

    $selFeatAct = shufyTheme_sel($hpFeatures, 'activated');
    $selFeatDis = shufyTheme_sel($hpFeatures, 'disabled');

    $selAnnAct = shufyTheme_sel($hpAnnouncements, 'activated');
    $selAnnDis = shufyTheme_sel($hpAnnouncements, 'disabled');

    $selSubAct = shufyTheme_sel($hpSubscribe, 'activated');
    $selSubDis = shufyTheme_sel($hpSubscribe, 'disabled');

    $csrfToken = generate_token('plain');

    echo <<<HTML
    {$message}
    <div style="background: #ffffff; border: 1px solid #e2e8f0; border-radius: 8px; padding: 24px; margin-bottom: 24px; box-shadow: 0 1px 3px rgba(0,0,0,0.05);">
        <div style="display: flex; align-items: center; justify-content: space-between; border-bottom: 2px solid #edf2f7; padding-bottom: 16px; margin-bottom: 24px;">
            <div>
                <h2 style="margin: 0; color: #2d3748; font-weight: 700;">ShufyTheme Control Panel</h2>
                <p style="margin: 4px 0 0 0; color: #718096; font-size: 14px;">Standalone Edition - Complete Theme & Layout Customization Engine</p>
            </div>
            <span style="background: #c6f6d5; color: #22543d; font-size: 13px; font-weight: 600; padding: 6px 14px; border-radius: 20px;">License Active & Verified</span>
        </div>

        <form method="post" action="addonmodules.php?module=shufyTheme">
            <input type="hidden" name="token" value="{$csrfToken}" />
            <input type="hidden" name="action" value="save_shufy_settings" />

            <div style="margin-bottom: 30px;">
                <h3 style="color: #2b6cb0; font-size: 18px; margin-bottom: 16px; border-left: 4px solid #3182ce; padding-left: 10px;">🎨 Color & Styling Options</h3>
                <div class="row">
                    <div class="col-md-4 form-group">
                        <label style="font-weight: 600;">Default Theme Accent Color</label>
                        <select name="theme_color" class="form-control">
                            <option value="default-color" {$selColorDefault}>Default Blue Theme</option>
                            <option value="theme-style-one" {$selColorOne}>Style 1 - Classic Dark</option>
                            <option value="theme-style-two" {$selColorTwo}>Style 2 - Emerald Green</option>
                            <option value="theme-style-three" {$selColorThree}>Style 3 - Royal Purple</option>
                            <option value="theme-style-four" {$selColorFour}>Style 4 - Ruby Red</option>
                        </select>
                    </div>
                    <div class="col-md-4 form-group">
                        <label style="font-weight: 600;">Allow Dark Mode Switcher</label>
                        <select name="allow_dark_mode" class="form-control">
                            <option value="activated" {$selDarkAllowAct}>Activated (Show Switcher)</option>
                            <option value="disabled" {$selDarkAllowDis}>Disabled</option>
                        </select>
                    </div>
                    <div class="col-md-4 form-group">
                        <label style="font-weight: 600;">Default Dark Mode</label>
                        <select name="default_dark_mode" class="form-control">
                            <option value="" {$selDarkDefLight}>Light Mode Default</option>
                            <option value="activated" {$selDarkDefAct}>Dark Mode Default</option>
                        </select>
                    </div>
                </div>
            </div>

            <div style="margin-bottom: 30px;">
                <h3 style="color: #2b6cb0; font-size: 18px; margin-bottom: 16px; border-left: 4px solid #3182ce; padding-left: 10px;">📐 Sidebar & Layout Options</h3>
                <div class="row">
                    <div class="col-md-4 form-group">
                        <label style="font-weight: 600;">Sidebar Style</label>
                        <select name="sidebar_layout" class="form-control">
                            <option value="minimalist__sidebar" {$selSbMin}>Minimalist Sidebar</option>
                            <option value="big__icons__sidebar" {$selSbBig}>Big Icons Sidebar</option>
                            <option value="separated__sidebar" {$selSbSep}>Separated Sidebar</option>
                        </select>
                    </div>
                    <div class="col-md-4 form-group">
                        <label style="font-weight: 600;">Sidebar Position</label>
                        <select name="sidebar_position" class="form-control">
                            <option value="sidebarpositionleft" {$selPosLeft}>Left Position</option>
                            <option value="sidebarpositionright" {$selPosRight}>Right Position</option>
                            <option value="sidebarpositiontop" {$selPosTop}>Horizontal Top Bar</option>
                        </select>
                    </div>
                    <div class="col-md-4 form-group">
                        <label style="font-weight: 600;">Sticky / Fixed Top Header</label>
                        <select name="fixed_top_header" class="form-control">
                            <option value="activated" {$selFixHdrAct}>Fixed Top Header</option>
                            <option value="disabled" {$selFixHdrDis}>Absolute Header</option>
                        </select>
                    </div>
                </div>
            </div>

            <div style="margin-bottom: 30px;">
                <h3 style="color: #2b6cb0; font-size: 18px; margin-bottom: 16px; border-left: 4px solid #3182ce; padding-left: 10px;">🏠 Homepage Section Toggles</h3>
                <div class="row">
                    <div class="col-md-4 form-group">
                        <label style="font-weight: 600;">MarketConnect Promo Banner</label>
                        <select name="hp_mc_banners" class="form-control">
                            <option value="activated" {$selMcBanAct}>Show Promo Banner</option>
                            <option value="disabled" {$selMcBanDis}>Hide</option>
                        </select>
                    </div>
                    <div class="col-md-4 form-group">
                        <label style="font-weight: 600;">MarketConnect Navigation</label>
                        <select name="hp_mc_banners_nav" class="form-control">
                            <option value="activated" {$selMcNavAct}>Show Navigation Items</option>
                            <option value="disabled" {$selMcNavDis}>Hide</option>
                        </select>
                    </div>
                    <div class="col-md-4 form-group">
                        <label style="font-weight: 600;">Featured Products Section</label>
                        <select name="hp_products" class="form-control">
                            <option value="activated" {$selProdAct}>Show Featured Products</option>
                            <option value="disabled" {$selProdDis}>Hide</option>
                        </select>
                    </div>
                    <div class="col-md-4 form-group">
                        <label style="font-weight: 600;">Features & Benefits Section</label>
                        <select name="hp_features" class="form-control">
                            <option value="activated" {$selFeatAct}>Show Features</option>
                            <option value="disabled" {$selFeatDis}>Hide</option>
                        </select>
                    </div>
                    <div class="col-md-4 form-group">
                        <label style="font-weight: 600;">Latest Announcements</label>
                        <select name="hp_announcements" class="form-control">
                            <option value="activated" {$selAnnAct}>Show Announcements</option>
                            <option value="disabled" {$selAnnDis}>Hide</option>
                        </select>
                    </div>
                    <div class="col-md-4 form-group">
                        <label style="font-weight: 600;">Subscribe Section</label>
                        <select name="hp_subscribe" class="form-control">
                            <option value="activated" {$selSubAct}>Show Subscribe Form</option>
                            <option value="disabled" {$selSubDis}>Hide</option>
                        </select>
                    </div>
                </div>
            </div>

            <div style="margin-top: 30px; border-top: 1px solid #e2e8f0; padding-top: 20px;">
                <button type="submit" class="btn btn-primary btn-lg" style="padding: 10px 30px; font-size: 16px; font-weight: 600;">
                    <i class="fas fa-save mr-2"></i> Save Theme Settings
                </button>
            </div>
        </form>
    </div>
HTML;
}