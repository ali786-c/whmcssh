<!-- CloudHoste Domain Search Section -->
<div class="py-5" style="background-color: var(--ch-navy, #0b0e1a);">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-10 col-xl-8">
				<div class="p-4 p-md-5 rounded-3 text-center" style="background-color: var(--ch-surface-card-dark, #1A1C1E); border: 1px solid rgba(255, 255, 255, 0.1);">
					<h2 class="fs-22 fw-bold text-white mb-4">Search for a domain or transfer your own</h2>
					<form action="{$WEB_ROOT}/cart.php" method="get" class="search-filter d-flex align-items-center gap-2 max-w-90 mx-auto">
						<input type="hidden" name="a" value="add"/>
						<input type="hidden" name="domain" value="register"/>
						<input name="query" class="form-control form-control-lg bg-dark text-white border-secondary" placeholder="Search your domain name..." type="text" required />
						<button class="ch-btn-lime flex-shrink-0 px-4 py-3" type="submit">
							<i class="fas fa-search me-2"></i> Search
						</button>
					</form>
					<ul class="list-inline d-flex justify-content-center flex-wrap gap-3 align-items-center mt-4 mb-0">
						<li class="list-inline-item">
							<span class="badge bg-dark border border-secondary p-2 fs-14 text-white">
								<strong>.com</strong> <span class="text-muted fs-12">€13.48/Year</span>
							</span>
						</li>
						<li class="list-inline-item">
							<span class="badge bg-dark border border-secondary p-2 fs-14 text-white">
								<strong>.de</strong> <span class="text-muted fs-12">€4.78/Year</span>
							</span>
						</li>
						<li class="list-inline-item">
							<span class="badge bg-dark border border-secondary p-2 fs-14 text-white">
								<strong>.eu</strong> <span class="text-muted fs-12">€5.90/Year</span>
							</span>
						</li>
						<li class="list-inline-item">
							<span class="badge bg-dark border border-secondary p-2 fs-14 text-white">
								<strong>.co.uk</strong> <span class="text-muted fs-12">€7.51/Year</span>
							</span>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
