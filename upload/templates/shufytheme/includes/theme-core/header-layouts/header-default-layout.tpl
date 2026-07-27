{if $loginpage eq 0 and $templatefile ne "clientregister" and $templatefile ne "verify-email" and $templatefile ne "password-reset-container" and $templatefile ne "user-invite-accept"}
  <!-- start header -->
  <header class="header bg-white light-mode-texts fixed__header__layout">
	  <div class="page__container">
		  <div class="header__row d-flex justify-content-between align-items-center">
				<div class="top__header__website__identity website__identity__sidebar {if $coodivlayoutssettings.layoutsettingssidebarstyle|default:''=='sidebarheaderlogo'}d-flex{else}d-md-none d-flex{/if} align-items-center">		
					<button aria-label="sidebar toggle" class="header__burger"></button>	 
					<a aria-label="website homepage" class="website__identity__sidebar__link" href="https://cloudhoste.eu">
						{if $coodivsettings.siteaslogo|default:''=='activated'}
							<div class="website__identity__sidebar__text__logo__wrapper">
								<span class="website__identity__sidebar__text__logo__first__later">
									<span id="websiteidenditytextlogofirst">
									{if $coodivsettings.customtextlogo|default:'' == null}
										{$companyname}
									{else}
										{$coodivsettings.customtextlogo|default:''}
									{/if}
									</span>
								</span>
								<span id="websiteidenditytextlogofull" class="website__identity__sidebar__text__logo__full">
									{if $coodivsettings.customtextlogo|default:'' == null}
										{$companyname}
									{else}
										{$coodivsettings.customtextlogo|default:''}
									{/if}
								</span>
							</div>
						{else}
							{if $coodivsettings.defaultlogolinkfull|default:''}
								<img class="image__logo__tagline white__logo custom__website__full__logo" src="{$coodivsettings.defaultlogolinkfull|default:''}" alt="{$companyname} logo" />
								<img class="image__logo__tagline dark__logo custom__website__full__logo" src="{$coodivsettings.darklogolinkfull|default:''}" alt="{$companyname} logo" />
							{else}
								<img class="image__logo__tagline white__logo" src="{$WEB_ROOT}/templates/{$template}/assets/img/logo-light.svg" alt="{$companyname}" style="height: 38px;" />
								<img class="image__logo__tagline dark__logo" src="{$WEB_ROOT}/templates/{$template}/assets/img/logo-dark.svg" alt="{$companyname}" style="height: 38px;" />
							{/if}
						{/if}
					</a>
				</div>
				{if $coodivsettings.headeranoncement|default:''=='activated' || $coodivsettings.id|default:'' != '1'}
					{if $announcements}
						{include file="$template/includes/theme-core/header-announcement.tpl"}
					{/if}
				{/if}
				<div class="right__header__control d-flex align-items-center">
					{if $coodivcolorsettings.allowdarkmode|default:''=='activated' || $coodivcolorsettings.id|default:'' != '1'}
						<div class="header__darkmode__selector__wrapper">
							<button onclick="modeSwitcher()" class="header__darkmode__selector__btn"><span class="header__darkmode__selector__tooltip" id="theme-toggle"></span></button>
						</div>
					{/if}
					
					{if $coodivsettings.headerlanguage|default:''=='activated' || $coodivsettings.id|default:'' != '1'}
						<div class="language__dropdown__select_wrapper top header__language">
							{include file="$template/includes/theme-core/language-chooser.tpl"}
						</div>
					{/if}
					
					{if !$loggedin && $currencies}
						<div class="language__dropdown__select_wrapper top header__language">
							{include file="$template/includes/theme-core/currency-chooser.tpl"}
						</div>
					{/if}

					<div class="header__control">
						{include file="$template/includes/theme-core/header-cart.tpl"}
						{if $loggedin}{include file="$template/includes/theme-core/header-notifications.tpl"}{/if}
						{include file="$template/includes/theme-core/header-account.tpl"}
					</div>
					{if !$loggedin}
						<div class="header__not__loggined__btns">
							{if $condlinks.allowClientRegistration=='on'}
								<a aria-label="register link" class="header__link header__not__loggined__btns__item" href="{$WEB_ROOT}/register.php"><i class="far fa-users"></i> <span class="text d-md-flex d-none">{lang key='clientregistertitle'}</span></a>
							{/if}
							<a aria-label="login link" class="button header__button ml-lg-2 header__not__loggined__btns__item " href="{$WEB_ROOT}/login.php"><i class="far fa-user"></i> <span class="text d-md-flex d-none">{lang key='account'}</span></a>
						</div>
					{/if}
				</div>
		  </div>
	  </div>
  </header>
  <!-- end header -->
  <div class="homepage__main__wrapper page__container"> 
  <div class="sidebar__page__wrapper">
  <div class="sidebar minimal__sidebar {if $coodivsidebaroptions.themesidebarsettingscollapsed|default:''=='activated' || $coodivsidebaroptions.id|default:'' != '1'}{else}full__width{/if}">
	<div class="sidebar__container">
		{if $coodivlayoutssettings.layoutsettingssidebarstyle|default:''=='sidebarsidebarlogo' || $coodivlayoutssettings.id|default:'' != '1'}
		<div class="website__identity__sidebar d-flex align-items-center">		
			<a aria-label="Website homepage" class="website__identity__sidebar__link" href="https://cloudhoste.eu">
				{if $coodivsettings.siteaslogo|default:''=='activated'}
					<div class="website__identity__sidebar__text__logo__wrapper">
						<span class="website__identity__sidebar__text__logo__first__later">
							<span id="websiteidenditytextlogofirst">
							{if $coodivsettings.customtextlogo|default:'' == null}
								{$companyname}
							{else}
								{$coodivsettings.customtextlogo|default:''}
							{/if}
							</span>
						</span>
						<span id="websiteidenditytextlogofull" class="website__identity__sidebar__text__logo__full">
							{if $coodivsettings.customtextlogo|default:'' == null}
								{$companyname}
							{else}
								{$coodivsettings.customtextlogo|default:''}
							{/if}
						</span>
					</div>
				{else}
					{if $coodivsettings.defaultlogolinkfull|default:''}
						<img class="image__logo__tagline white__logo custom__website__full__logo" src="{$coodivsettings.defaultlogolinkfull|default:''}" alt="{$companyname} logo" />
						<img class="image__logo__tagline dark__logo custom__website__full__logo" src="{$coodivsettings.darklogolinkfull|default:''}" alt="{$companyname} logo" />
					{else}
						<img class="image__logo__tagline white__logo" src="{$WEB_ROOT}/templates/{$template}/assets/img/logo-light.svg" alt="{$companyname}" style="height: 38px;" />
						<img class="image__logo__tagline dark__logo" src="{$WEB_ROOT}/templates/{$template}/assets/img/logo-dark.svg" alt="{$companyname}" style="height: 38px;" />
					{/if}
				{/if}
			</a>
		</div>
		{/if}
		<button aria-label="sidebar close" class="sidebar__close"><i class="icon fal fa-times"></i></button>
		<div class="sidebar__menu">
		<div class="sidebar__extend__toggle"><span class="extend">Extend</span><span class="reduce">Reduce</span></div>
		{include file="$template/includes/shuffythemenavbar.tpl" navbar=$primaryNavbar}
		</div>
		<div class="sidebar__foot">
		  {if $loggedin}
			<a class="sidebar__item sidebar__logout" href="{$WEB_ROOT}/logout.php"><i class="side__bar__item__icon fal fa-power-off"></i> <span class="side__bar__item__text">{lang key='clientareanavlogout'}</span></a>
		  {else}
			<a class="sidebar__item" href="{$WEB_ROOT}/login.php"><i class="side__bar__item__icon fal fa-user"></i> <span class="side__bar__item__text">{lang key='clientlogin'}</span></a>
		  {/if}
	   </div>
	  </div>
  </div>
  {/if}


  <div class="main__page__wraper">
	{if $loginpage eq 0 and $templatefile ne "clientregister" and $templatefile ne "verify-email" and $templatefile ne "password-reset-container"}
	{if $templatefile == 'homepage' || $skipMainBodyContainer || $templatefile == 'domainregister' || $templatefile == 'domaintransfer'}
	<div class="pt-0">
	{else}
	
	{if !$inShoppingCart}
		<div class="full__with__section not__shoppingcart__page__header">
			<div class="main__page__content">
				<h6 class="coodiv-text-6 font-weight-bold mb-0">{$pagetitle}</h6>
				<nav class="master-breadcrumb" aria-label="breadcrumb">
					{include file="$template/includes/breadcrumb.tpl"}
				</nav>
			</div>
		</div>
		{if $primarySidebar->hasChildren() || $secondarySidebar->hasChildren()}
			<div class="full__with__section full__width__secondarysidebar__menu into__main__page__content__full__width__element {if $templatefile == 'upgrade' || $templatefile == 'upgradesummary' || $templatefile == 'complete'}full__width__secondarysidebar__menu__upgrade{/if}">
				<div class="full__width__secondarysidebar__menu__item main__page__content d-flex align-items-start">
					{if $primarySidebar->hasChildren() &&  $templatefile != 'viewticket'}
						{include file="$template/includes/sidebar.tpl" sidebar=$primarySidebar}
					{/if}
					{if $secondarySidebar->hasChildren()}
						{include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
					{/if}
				</div>
			</div>
		{/if}
	{/if}
	<div class="{if $inShoppingCart}shopping__cart__main__page__content{else}main__page__content{/if}">
	{if $templatefile == 'viewticket'}
		{if $invalidTicketId}
			{include file="$template/includes/alert.tpl" type="danger" title="{lang key='thereisaproblem'}" msg="{lang key='supportticketinvalid'}"}
		{else}
			{if $closedticket}
				{include file="$template/includes/alert.tpl" type="warning" title="{lang key='supportticketsstatusclosed'}" msg="{lang key='supportticketclosedmsg'}"}
			{/if}

			{if $errormessage}
				{include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
			{/if}
		{/if}
	{/if}
	{if !$inShoppingCart && $templatefile != 'viewinvoice'} 
		{include file="$template/includes/network-issues-notifications.tpl"}
		{include file="$template/includes/validateuser.tpl"}
		{include file="$template/includes/verifyemail.tpl"}
	{/if}
	{/if}
	<section class="{if $templatefile == 'homepage'}homepage__main__body{else if $inShoppingCart}shopping__main__body{/if}" {if $templatefile != 'domainregister' && $templatefile != 'domaintransfer'}id="main-body"{/if}>
		<div class="{if !$skipMainBodyContainer}{/if}">
			{if $primarySidebar->hasChildren() &&  $templatefile == 'viewticket'}
				<div class="row justify-content-start mt-5">
					<div class="{if $templatefile == 'viewticket'}order-md-1 order-12{/if} col-md-3 col-12 position-relative">
						<div class="viewticket__sidebar__data">
							{include file="$template/includes/sidebar.tpl" sidebar=$primarySidebar}
						</div>
					</div>
					<div class="{if $templatefile == 'viewticket'}order-md-12 order-1{/if} col-md-9 col-12 primary-content">
			{else}
				<div class="row">
					<div class="col-12 primary-content">
			{/if}
	{else}	
		{if $loginpage && $coodivsettings.loginstyle|default:''=='loginstyleone' || $coodivsettings.id|default:'' != '1' || $templatefile == "clientregister" && $coodivsettings.registerstyle|default:''=='registerstyleone'}
			{if $templatefile ne "verify-email" && $templatefile ne "password-reset-container"}
				{include file="$template/includes/theme-core/login-sidebar.tpl"}
			{/if}
		{/if}
	{/if}
