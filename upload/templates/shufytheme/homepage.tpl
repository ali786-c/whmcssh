{include file="$template/includes/theme-core/init-standalone.tpl"}
<div class="main__page__content cloudhoste-homepage-wrapper">
	<!-- CloudHoste Main Website Hero Banner -->
	{include file="$template/includes/theme-front/cloudhoste-hero.tpl"}
	
	<!-- CloudHoste 4 Circular Service Cards -->
	{include file="$template/includes/theme-front/cloudhoste-services.tpl"}
	
	<!-- CloudHoste Domain Search Filter Section -->
	{include file="$template/includes/theme-front/cloudhoste-domain-search.tpl"}
	
	<!-- WHMCS Featured Products & Pricing Grid -->
	{if $coodivhomepagesettings.themehomepagesettinghomepagefeaturedsection|default:''=='activated' || $coodivhomepagesettings.id|default:'' != '1'}
		{include file="$template/includes/theme-front/front-products.tpl"}
	{/if}
	
	<!-- WHMCS Features Section -->
	{if $coodivhomepagesettings.themehomepagesettingservicesfeatures|default:''=='activated' || $coodivhomepagesettings.id|default:'' != '1'}
		{include file="$template/includes/theme-front/front-features.tpl"}
	{/if}
	
	<!-- WHMCS Latest Announcements -->
	{if $coodivhomepagesettings.themehomepagesettingannouncements|default:''=='activated' || $coodivhomepagesettings.id|default:'' != '1'}
		{include file="$template/includes/theme-front/front-latest-announcements.tpl"}
	{/if}
</div>
