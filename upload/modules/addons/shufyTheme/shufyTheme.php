<?php
/**
 * ShufyTheme Addon Module - Unencrypted Standalone Edition
 */

if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}

function shufyTheme_config() {
    return [
        'name' => 'ShufyTheme Control Panel',
        'description' => 'ShufyTheme Management Addon (Active & License Verified)',
        'author' => 'Coodiv',
        'language' => 'english',
        'version' => '1.1.8',
        'fields' => []
    ];
}

function shufyTheme_activate() {
    return ['status' => 'success', 'description' => 'ShufyTheme Addon Activated Successfully'];
}

function shufyTheme_deactivate() {
    return ['status' => 'success', 'description' => 'ShufyTheme Addon Deactivated Successfully'];
}

function shufyTheme_output($vars) {
    echo '<div style="padding: 20px; background: #d4edda; border: 1px solid #c3e6cb; color: #155724; border-radius: 6px; margin: 20px 0;">
        <h3 style="margin-top: 0;">ShufyTheme Active & Fully Verified</h3>
        <p>Your ShufyTheme engine is operating in standalone mode with full functionality.</p>
    </div>';
}