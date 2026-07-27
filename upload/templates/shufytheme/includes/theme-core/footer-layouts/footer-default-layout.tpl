<div class="main__footer__wrapper full__footer full__with__section">
	{if $coodivfootersettings.themefootersettingstyle|default:''!='footerlayoutstylesaven'}
	<div class="bottom__footer__wrapper">
		<div class="main__page__content">
			<div class="row justify-content-start">
				{if $coodivfootersettings.themefootersettingstyle|default:''!='footerlayoutstyletwo' && $coodivfootersettings.themefootersettingstyle|default:''!='footerlayoutstylefive'}
				<div class="col-lg-4 col-12 mb-lg-0 mb-15 {if $coodivfootersettings.themefootersettingstyle|default:''=='footerlayoutstylethree' || $coodivfootersettings.themefootersettingstyle|default:''=='footerlayoutstylesix'}order-12{/if}">
					<div class="footer__website__informations">
					{if $coodivfootersettings.themefootersettinglogo|default:''=='activated' || $coodivfootersettings.id|default:'' != '1'}
						<div class="footer__logo__wrapper website__identity__sidebar d-flex align-items-center justify-content-center mb-4">		
							<a aria-label="website homepage" class="website__identity__sidebar__link text-center d-flex align-items-center gap-10" href="https://cloudhoste.eu">
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
					<p class="coodiv-text-12 font-weight-500">
					{if $coodivfootersettings.themefootersettingdescription|default:'' == null}
						{$LANG.shufytheme.footercompanydesciption}
					{else}
						{$coodivfootersettings.themefootersettingdescription|default:''}
					{/if}
					</p>
					<div class="d-flex flex-column gap-5 mt-7">
						{if $coodivfootersettings.themefootersettingmobile|default:''=='activated' || $coodivfootersettings.id|default:'' != '1'}
						<a class="footer__contact__methods__item d-flex align-items-center gap-6 coodiv-text-12 font-weight-600" href="tel:{if $coodivfootersettings.themefootersettingcustommobile|default:'' == null}00123456789011{else}{$coodivfootersettings.themefootersettingcustommobile|default:''}{/if}"><i class="fal fa-phone"></i> {if $coodivfootersettings.themefootersettingcustommobile|default:'' == null}00123 456 78 90 11{else}{$coodivfootersettings.themefootersettingcustommobile|default:''}{/if}</a>
						{/if}
						{if $coodivfootersettings.themefootersettingemail|default:''=='activated' || $coodivfootersettings.id|default:'' != '1'}
						<a class="footer__contact__methods__item d-flex align-items-center gap-6 coodiv-text-12 font-weight-600" href="mailto:{if $coodivfootersettings.themefootersettingcustomemail|default:'' == null}support@coodiv.net{else}{$coodivfootersettings.themefootersettingcustomemail|default:''}{/if}"><i class="fal fa-envelope"></i> {if $coodivfootersettings.themefootersettingcustomemail|default:'' == null}support@coodiv.net{else}{$coodivfootersettings.themefootersettingcustomemail|default:''}{/if}</a>
						{/if}
						{if $coodivfootersettings.themefootersettingadress|default:''=='activated' || $coodivfootersettings.id|default:'' != '1'}
						<p class="footer__contact__methods__item d-flex align-items-center gap-6 coodiv-text-12 font-weight-500"><i class="fal fa-home"></i>{if $coodivfootersettings.themefootersettingcustomcopyrighttext|default:'' == null}551 Swanston Street, Melbourne, Victoria 3053 Australia{else}{$coodivfootersettings.themefootersettingcustomcopyrighttext|default:''}{/if}</p>
						{/if}
					</div>
					</div>
				</div>
				{/if}
				
				{if $shufythemefooteritems}
					{foreach $shufythemefooteritems as $element}
						<div class="{if $coodivfootersettings.accordionfootermenu|default:''=='activated' || $coodivfootersettings.id|default:'' != '1'}accordion__footer__menu{/if} footer__menu__links__wrapper col-md col-4 mb-10 mb-md-0">
							<div {if $element.id}id="{$element.id}"{/if} class="bottom__footer__links__wrapper">
								<h6 class="{if $element.css_class}{$element.css_class}{/if} coodiv-text-8 font-weight-700 footer__title d-flex align-items-center gap-5">
									{if $element.css_icon}<i class="coodiv-text-11 footer__title__icon {$element.css_icon}"></i>{/if}
									{$element.title}
									{if $element.badge!=="none"}<span class="footer__links__badge">{$element.badge}</span>{/if}
								</h6>
								{if $element.children}
								<ul class="bottom__footer__links__list">
									{foreach $element.children as $child}
										<li>
										<a {if $child.targetwindow=="_blank"}target="_blank"{/if} class="{if $child.css_class}{$child.css_class}{/if} d-flex align-items-center gap-5" {if $child.id}id="{$child.id}"{/if} href="{$child.url}">
											{if $child.css_icon}<i class="coodiv-text-11 footer__links__icon {$child.css_icon}"></i>{/if}
											{$child.title}
											{if $child.badge!=="none"}<span class="footer__links__badge">{$child.badge}</span>{/if}
										</a>
										</li>
									{/foreach}
								</ul>
								{/if}
							</div>
						</div>
					{/foreach}
				{else}
					<div class="{if $coodivfootersettings.accordionfootermenu|default:''=='activated' || $coodivfootersettings.id|default:'' != '1'}accordion__footer__menu{/if} footer__menu__links__wrapper col-md col-4 mb-10 mb-md-0">
						<div class="bottom__footer__links__wrapper">
							<h6 class="coodiv-text-8 font-weight-700 footer__title d-flex align-items-center gap-5">{$LANG.shufytheme.footerProduct}</h6>
							<ul class="bottom__footer__links__list">
								<li><a href="#">{$LANG.shufytheme.footerWebHosting}</a></li>
								<li><a href="#">{$LANG.shufytheme.footerResellerHosting}</a></li>
								<li><a href="#">{$LANG.shufytheme.footerVpsHosting}</a></li>
								<li><a href="#">{$LANG.shufytheme.footerDedicatedServers}</a></li>
							</ul>
						</div>
					</div>

					<div class="{if $coodivfootersettings.accordionfootermenu|default:''=='activated' || $coodivfootersettings.id|default:'' != '1'}accordion__footer__menu{/if} footer__menu__links__wrapper col-md col-4 mb-md-0">
						<div class="bottom__footer__links__wrapper">
							<h6 class="coodiv-text-8 font-weight-700 footer__title d-flex align-items-center gap-5">{$LANG.shufytheme.footerResources}</h6>
							<ul class="bottom__footer__links__list">
								<li><a href="#">{$LANG.shufytheme.footerMinecraftHosting}</a></li>
								<li><a href="#">{$LANG.shufytheme.footerWebsiteBuilder}</a></li>
								<li><a href="#">{$LANG.shufytheme.footerCpanelReseller}</a></li>
								<li><a href="#">{$LANG.shufytheme.footerWordpressHosting}</a></li>
							</ul>
						</div>
					</div>

					<div class="{if $coodivfootersettings.accordionfootermenu|default:''=='activated' || $coodivfootersettings.id|default:'' != '1'}accordion__footer__menu{/if} footer__menu__links__wrapper col-md col-4 mb-md-0">
						<div class="bottom__footer__links__wrapper">
							<h6 class="coodiv-text-8 font-weight-700 footer__title d-flex align-items-center gap-5">{$LANG.shufytheme.footerDomains}</h6>
							<ul class="bottom__footer__links__list">
								<li><a href="#">{$LANG.shufytheme.footerDomainChecker}</a></li>
								<li><a href="#">{$LANG.shufytheme.footerFreeDomain}</a></li>
								<li><a href="#">{$LANG.shufytheme.footerWhoisChecker}</a></li>
							</ul>
						</div>
					</div>

					<div class="{if $coodivfootersettings.accordionfootermenu|default:''=='activated' || $coodivfootersettings.id|default:'' != '1'}accordion__footer__menu{/if} footer__menu__links__wrapper col-md col-4 mb-md-0">
						<div class="bottom__footer__links__wrapper">
							<h6 class="coodiv-text-8 font-weight-700 footer__title d-flex align-items-center gap-5">{$LANG.shufytheme.footerServices}</h6>
							<ul class="bottom__footer__links__list">
								<li><a href="#">{$LANG.shufytheme.footerSslCertificates}</a></li>
								<li><a href="#">{$LANG.shufytheme.footerEmailServices}</a></li>
								<li><a href="#">{$LANG.shufytheme.footerSiteBuilder}</a></li>
								<li><a href="#">{$LANG.shufytheme.footerWebsiteBuilder}</a></li>
								<li><a href="#">{$LANG.shufytheme.footerProfessionalEmail}</a></li>
								<li><a href="#">{$LANG.shufytheme.footerWebsiteSecurity}</a></li>
								<li><a href="#">{$LANG.shufytheme.footerWebsiteBackup}</a></li>
								<li><a href="#">{$LANG.shufytheme.footerSeoTools}</a></li>
							</ul>
						</div>
					</div>

					<div class="{if $coodivfootersettings.accordionfootermenu|default:''=='activated' || $coodivfootersettings.id|default:'' != '1'}accordion__footer__menu{/if} footer__menu__links__wrapper col-md col-4 mb-md-0">
						<div class="bottom__footer__links__wrapper">
							<h6 class="coodiv-text-8 font-weight-700 footer__title d-flex align-items-center gap-5">{$LANG.shufytheme.footerLegal}</h6>
							<ul class="bottom__footer__links__list">
								<li><a href="#">{$LANG.shufytheme.privacyPolicy}</a></li>
								<li><a href="#">{$LANG.shufytheme.termsConditions}</a></li>
								<li><a href="#">{$LANG.shufytheme.footerBrowserCookies}</a></li>
								<li><a href="#">{$LANG.shufytheme.footerLicenses}</a></li>
								<li><a href="#">{$LANG.shufytheme.footerSettings}</a></li>
								<li><a href="#">{$LANG.shufytheme.contactus}</a></li>
							</ul>
						</div>
					</div>
				{/if}
			</div>
		</div>
	</div>
	{/if}

	{if $coodivfootersettings.themefootersettingstyle|default:''!='footerlayoutstylefour' && $coodivfootersettings.themefootersettingstyle|default:''!='footerlayoutstylefive' && $coodivfootersettings.themefootersettingstyle|default:''!='footerlayoutstylesix'}
		<div class="footer__copyright__wrapper border-top">
			<div class="main__page__content">
				<div class="row justify-content-between">
					<div class="col-md col-12">
						<div class="footer__copyright__wrapper__text">
							<h6 class="the__copyright__text coodiv-text-12 mb-0 font-weight-500 text-md-left text-center">
							{lang key="copyrightFooterNotice" year=$date_year company=$companyname}
							{if $coodivfootersettings.themefootersettingpoworedbycoodiv|default:''=='activated' || $coodivfootersettings.id|default:'' != '1'}
								Powered by <a target="_blank" href="https://coodiv.net/">Coodiv</a>
							{/if}
							</h6>
														
						</div>
					</div>
					{if $coodivfootersettings.themefootersettingsocialicons|default:'' == 'activated' || $coodivfootersettings.id|default:'' != '1'}
					<div class="col-md col-12 mt-md-0 mt-5 d-flex align-items-center  justify-content-md-end justify-content-center gap-10">
						<ul class="footer__copyright__social__accounts">
							{foreach $socialAccounts as $account}
								<li><a aria-label="social media links" target="_blank" href="{$account->getUrl()}"><i class="{$account->getFontAwesomeIcon()}"></i></a></li>
							{/foreach}
						</ul>
						{if $coodivsettings.footerlanguagelanguage|default:''=='activated'}
							<div class="language__dropdown__select_wrapper ml-3">
								{include file="$template/includes/theme-core/language-chooser.tpl"}
							</div>
						{/if}
					</div>
					{/if}
				</div>
			</div>
		</div>
	{/if}
</div>