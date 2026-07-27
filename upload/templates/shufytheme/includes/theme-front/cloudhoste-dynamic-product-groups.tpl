<!-- CloudHoste Dynamic WHMCS Product Groups Grid -->
<div class="py-5" style="background-color: var(--ch-navy, #0b0e1a);">
	<div class="container py-3">
		<div class="text-center mb-5">
			<h2 class="text-white font-weight-700 display-5 mb-2">Our Hosting & Cloud Solutions</h2>
			<p class="text-light opacity-75 fs-18">Choose the perfect plan tailored to your business performance requirements.</p>
		</div>
		
		<div class="row justify-content-center g-4">
			{if $chDynamicProductGroups}
				{foreach $chDynamicProductGroups as $group}
					<div class="col-lg-4 col-md-6 d-flex">
						<div class="ch-product-group-card ch-card-{$group.color} p-4 p-xl-5 rounded-4 d-flex flex-column justify-content-between w-100 position-relative shadow-sm transition-all">
							<div>
								<div class="ch-card-icon-wrapper mb-4">
									<i class="{$group.icon} fs-32"></i>
								</div>
								<h3 class="font-weight-800 fs-28 mb-2 ch-card-title">{$group.name}</h3>
								<p class="font-weight-600 fs-16 mb-3 ch-card-headline">{$group.headline}</p>
								<p class="fs-14 opacity-80 mb-4 ch-card-tagline">{$group.tagline}</p>
							</div>
							<div class="mt-auto pt-4 border-top border-opacity-10 border-dark">
								<div class="mb-4">
									<span class="d-block font-weight-800 display-6 ch-card-price">From {$group.minPrice}</span>
									<span class="fs-12 opacity-70">Fast, reliable, and easy to use.</span>
								</div>
								<a href="{$group.url}" class="btn btn-block py-3 rounded-pill font-weight-700 fs-16 ch-btn-card-{$group.color}">
									Explore Plans <i class="fas fa-arrow-right ms-2"></i>
								</a>
							</div>
						</div>
					</div>
				{/foreach}
			{else}
				<!-- Fallback Default Cards if no groups in DB -->
				<div class="col-lg-4 col-md-6 d-flex">
					<div class="ch-product-group-card ch-card-blue p-4 p-xl-5 rounded-4 d-flex flex-column justify-content-between w-100">
						<div>
							<div class="ch-card-icon-wrapper mb-4"><i class="fab fa-wordpress fs-32"></i></div>
							<h3 class="font-weight-800 fs-28 mb-2">WordPress Hosting</h3>
							<p class="font-weight-600 fs-16 mb-3">Optimized for speed and security.</p>
							<p class="fs-14 opacity-80 mb-4">Our Managed WordPress Hosting platform with WooCommerce gives you the freedom to sell anything online.</p>
						</div>
						<div class="mt-auto pt-4 border-top border-opacity-10 border-dark">
							<div class="mb-4">
								<span class="d-block font-weight-800 display-6">From €2.49/mo</span>
								<span class="fs-12 opacity-70">Fast, reliable, and easy to use.</span>
							</div>
							<a href="{$WEB_ROOT}/cart.php" class="btn btn-block py-3 rounded-pill font-weight-700 fs-16 ch-btn-card-blue">
								Get WordPress
							</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 d-flex">
					<div class="ch-product-group-card ch-card-green p-4 p-xl-5 rounded-4 d-flex flex-column justify-content-between w-100">
						<div>
							<div class="ch-card-icon-wrapper mb-4"><i class="fas fa-server fs-32"></i></div>
							<h3 class="font-weight-800 fs-28 mb-2">Dedicated & VPS Servers</h3>
							<p class="font-weight-600 fs-16 mb-3">Power and performance for demanding workloads.</p>
							<p class="fs-14 opacity-80 mb-4">Our Server Hosting provides high-performance server options with isolated NVMe resources to run mission-critical apps.</p>
						</div>
						<div class="mt-auto pt-4 border-top border-opacity-10 border-dark">
							<div class="mb-4">
								<span class="d-block font-weight-800 display-6">From €5.00/mo</span>
								<span class="fs-12 opacity-70">Unmatched reliability and flexibility.</span>
							</div>
							<a href="{$WEB_ROOT}/cart.php" class="btn btn-block py-3 rounded-pill font-weight-700 fs-16 ch-btn-card-green">
								View Servers
							</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 d-flex">
					<div class="ch-product-group-card ch-card-purple p-4 p-xl-5 rounded-4 d-flex flex-column justify-content-between w-100">
						<div>
							<div class="ch-card-icon-wrapper mb-4"><i class="fas fa-desktop fs-32"></i></div>
							<h3 class="font-weight-800 fs-28 mb-2">Web & n8n Hosting</h3>
							<p class="font-weight-600 fs-16 mb-3">Perfect for automation and web projects.</p>
							<p class="fs-14 opacity-80 mb-4">Pre-installed n8n automation and cPanel Web Hosting with free SSL and continuous automated daily backups.</p>
						</div>
						<div class="mt-auto pt-4 border-top border-opacity-10 border-dark">
							<div class="mb-4">
								<span class="d-block font-weight-800 display-6">From €2.95/mo</span>
								<span class="fs-12 opacity-70">Seamless hosting for web apps.</span>
							</div>
							<a href="{$WEB_ROOT}/cart.php" class="btn btn-block py-3 rounded-pill font-weight-700 fs-16 ch-btn-card-purple">
								Explore Plans
							</a>
						</div>
					</div>
				</div>
			{/if}
		</div>
	</div>
</div>
