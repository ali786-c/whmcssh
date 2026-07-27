{foreach $navbar as $item}
	{assign var="navUri" value=$item->getUri()}
	{if $item->getLabel()|lower|strpos:"web hosting" !== false}
		{assign var="navUri" value="https://cloudhoste.eu/web-hosting.html"}
	{else if $item->getLabel()|lower|strpos:"vps" !== false}
		{assign var="navUri" value="https://cloudhoste.eu/vps-hosting.html"}
	{else if $item->getLabel()|lower|strpos:"dedicated" !== false}
		{assign var="navUri" value="https://cloudhoste.eu/buy-dedicated-server.html"}
	{else if $item->getLabel()|lower|strpos:"cloud server" !== false}
		{assign var="navUri" value="https://cloudhoste.eu/cloud-server-hosting.html"}
	{else if $item->getLabel()|lower|strpos:"wordpress" !== false}
		{assign var="navUri" value="https://cloudhoste.eu/buy-wordpress-hosting.html"}
	{else if $item->getLabel()|lower|strpos:"reseller" !== false}
		{assign var="navUri" value="https://cloudhoste.eu/reseller-hosting.html"}
	{else if $item->getLabel()|lower|strpos:"n8n" !== false}
		{assign var="navUri" value="https://cloudhoste.eu/n8n-hosting.html"}
	{else if $item->getLabel()|lower|strpos:"contact" !== false}
		{assign var="navUri" value="https://cloudhoste.eu/contact.html"}
	{/if}

	{if $item->hasChildren()}
		<div menuItemName="{$item->getName()}" class="sidebar__item sidebar__item_dropdown" id="{$item->getId()}-menu-wrapper">
			<div class="sidebar__top">
			  <button aria-label="{$item->getName()} Menu" class="sidebar__head">
				  {if $item->hasIcon()}
				  <i class="side__bar__item__icon {$item->getIcon()}"></i>
				  {else}
				  <i class="side__bar__item__icon fal fa-home"></i>
				  {/if}
				  <span class="side__bar__item__text">{$item->getLabel()}</span>
				  {if $item->getBadge()!=="none" && $item->hasBadge()}
					 <span class="side__bar__item__icon__badge">{$item->getBadge()}</span>
				  {/if}
			  </button>
			</div>
			<div class="sidebar__body links__with__background" id="{$item->getId()}-menu-item">
				<span class="sidebar__dropdown__title">{$item->getLabel()}</span>
				<div class="sidebar__body__scrollable__element">
					{foreach $item->getChildren() as $childItem}
						{assign var="childUri" value=$childItem->getUri()}
						{if $childItem->getLabel()|lower|strpos:"web hosting" !== false || $childItem->getUri()|lower|strpos:"web-hosting" !== false}
							{assign var="childUri" value="https://cloudhoste.eu/web-hosting.html"}
						{else if $childItem->getLabel()|lower|strpos:"vps" !== false || $childItem->getUri()|lower|strpos:"vps" !== false}
							{assign var="childUri" value="https://cloudhoste.eu/vps-hosting.html"}
						{else if $childItem->getLabel()|lower|strpos:"dedicated" !== false || $childItem->getUri()|lower|strpos:"dedicated" !== false}
							{assign var="childUri" value="https://cloudhoste.eu/buy-dedicated-server.html"}
						{else if $childItem->getLabel()|lower|strpos:"cloud server" !== false || $childItem->getUri()|lower|strpos:"cloud-server" !== false}
							{assign var="childUri" value="https://cloudhoste.eu/cloud-server-hosting.html"}
						{else if $childItem->getLabel()|lower|strpos:"wordpress" !== false || $childItem->getUri()|lower|strpos:"wordpress" !== false}
							{assign var="childUri" value="https://cloudhoste.eu/buy-wordpress-hosting.html"}
						{else if $childItem->getLabel()|lower|strpos:"reseller" !== false || $childItem->getUri()|lower|strpos:"reseller" !== false}
							{assign var="childUri" value="https://cloudhoste.eu/reseller-hosting.html"}
						{else if $childItem->getLabel()|lower|strpos:"n8n" !== false || $childItem->getUri()|lower|strpos:"n8n" !== false}
							{assign var="childUri" value="https://cloudhoste.eu/n8n-hosting.html"}
						{else if $childItem->getLabel()|lower|strpos:"register a new domain" !== false || $childItem->getUri()|lower|strpos:"domain/register" !== false}
							{assign var="childUri" value="https://cloudhoste.eu/domain-search.html"}
						{else if $childItem->getLabel()|lower|strpos:"transfer domain" !== false || $childItem->getUri()|lower|strpos:"domain/transfer" !== false}
							{assign var="childUri" value="https://cloudhoste.eu/domain-transfer.html"}
						{else if $childItem->getLabel()|lower|strpos:"ddos" !== false || $childItem->getUri()|lower|strpos:"ddos" !== false}
							{assign var="childUri" value="https://cloudhoste.eu/ddos-protection.html"}
						{else if $childItem->getLabel()|lower|strpos:"ssl" !== false || $childItem->getUri()|lower|strpos:"ssl" !== false}
							{assign var="childUri" value="https://cloudhoste.eu/ssl-certificate.html"}
						{/if}
						<a href="{$childUri}" class="sidebar__link {if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}" {if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if}>
							 {if $childItem->hasIcon()}
							 <i class="{$childItem->getIcon()}"></i>
							 {/if}
							 {$childItem->getLabel()}
							 {if $childItem->hasBadge()}<span class="childitem__side__bar__item__icon__badge">{$childItem->getBadge()}</span>{/if}
						 </a>
					{/foreach}
				</div>
			</div>
		</div>
	{else}
		<a aria-label="{$item->getName()} link" menuItemName="{$item->getName()}" id="{$item->getId()}" class="sidebar__item {if $item->getClass()} {$item->getClass()}{/if}" href="{$navUri}" {if $item->getAttribute('target')} target="{$item->getAttribute('target')}"{/if} data-placement="right" title="{$item->getLabel()}">
			{if $item->hasIcon()}
			<i class="side__bar__item__icon {$item->getIcon()}"></i>
			{else}
			<i class="side__bar__item__icon fal fa-home"></i>
			{/if}
			<span class="side__bar__item__text">{$item->getLabel()}</span>
			{if $item->getBadge()!=="none" && $item->hasBadge()}
				<span class="side__bar__item__icon__badge">{$item->getBadge()}</span>
			{/if}
		</a>
	{/if}	
{/foreach}
