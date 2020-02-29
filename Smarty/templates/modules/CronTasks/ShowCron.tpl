{*<!--
/*********************************************************************************
  ** The contents of this file are subject to the vtiger CRM Public License Version 1.0
   * ("License"); You may not use this file except in compliance with the License
   * The Original Code is:  vtiger CRM Open Source
   * The Initial Developer of the Original Code is vtiger.
   * Portions created by vtiger are Copyright (C) vtiger.
   * All Rights Reserved.
 ********************************************************************************/
-->*}
<section role="dialog" tabindex="-1" class="slds-modal slds-fade-in-open slds-modal_small" aria-labelledby="EditInvHeading" aria-modal="true" aria-describedby="EditInv">
<div class="slds-modal__container">
	<header class="slds-modal__header">
		<button class="slds-button slds-button_icon slds-modal__close slds-button_icon-inverse" title="{$APP.LBL_CLOSE}" onClick="hide('editdiv');">
			<svg class="slds-button__icon slds-button__icon_large" aria-hidden="true">
				<use xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#close"></use>
			</svg>
			<span class="slds-assistive-text">{$APP.LBL_CLOSE}</span>
		</button>
		<h2 id="EditInvHeading" class="slds-modal__title slds-hyphenate slds-page-header__title">{$CRON_DETAILS.label}</h2>
	</header>
	<div class="slds-modal__content slds-p-around_medium">
		<div class="slds-page-header__meta-text">
			<label class="slds-form-element__label" for="cron_status">{$MOD.LBL_STATUS}</label>
			{if $CRON_DETAILS.status eq 1} {$MOD.LBL_ACTIVE} {else} {$MOD.LBL_INACTIVE} {/if}
		</div>
		<div class="slds-page-header__meta-text">
			<label class="slds-form-element__label" for="CronTime">{$MOD.LBL_FREQUENCY}</label>
			{$CRON_DETAILS.frequency} {if $CRON_DETAILS.time eq 'min'} {$MOD.LBL_MINUTES} {elseif $CRON_DETAILS.time eq 'daily'} {$MOD.LBL_DAILY} {else} {$MOD.LBL_HOURS} {/if}
		</div>
		<p class="slds-icon_container slds-icon-utility-info slds-m-top_large slds-page-header__meta-text">
			<svg class="slds-icon slds-icon slds-icon_xx-small slds-icon-text-default" aria-hidden="true">
				<use xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#info"></use>
			</svg>
			{$CRON_DETAILS.description|@getTranslatedString:$CRON_MODULE}
		</p>
	</div>
	<footer class="slds-modal__footer" style="width:100%;">
	</footer>
</div>
</section>
<div class="slds-backdrop slds-backdrop_open"></div>
