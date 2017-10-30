{*<!--
/*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************/
-->*}

<script type="text/javascript" charset="utf-8">
var moduleName = '{$entityName}';
var methodName = '{if isset($task->methodName)}{$task->methodName}{/if}';
{literal}
	function entityMethodScript($){

		function jsonget(operation, params, callback){
			var obj = {
				module:'com_vtiger_workflow',
				action:'com_vtiger_workflowAjax',
				file:operation, ajax:'true'
			};
			$.each(params,function(key, value){
				obj[key] = value;
			});
			$.get('index.php', obj,
				function(result){
					var parsed = JSON.parse(result);
					callback(parsed);
			});
		}

		$(document).ready(function(){
			jsonget('entitymethodjson', {module_name:moduleName}, function(result){
				$('#method_name_select_busyicon').hide();
				if(result.length==0){
					$('#method_name_select').hide();
					$('#message_text').show();
				} else {
					$('#method_name_select').show();
					$('#message_text').hide();
					$.each(result, function(i, v){
						var optionText = '<option value="'+v+'" '+(v==methodName?'selected':'')+'>'+v+'</option>';
						$('#method_name_select').append(optionText);
					});
				}
			});
		});
	}
{/literal}
entityMethodScript(jQuery);
</script>

<table class="slds-table slds-table--cell-buffer slds-no-row-hover slds-table--fixed-layout detailview_table task-operations-table">
	<tr>
		<td class='dvtCellLabel' align="right" width=15% nowrap="nowrap"><b>{$MOD.LBL_METHOD_NAME}</b></td>
		<td class='dvtCellInfo'>
			<span id="method_name_select_busyicon"><b>{$MOD.LBL_LOADING}</b><img src="{'vtbusy.gif'|@vtiger_imageurl:$THEME}" border="0"></span>
			<select name="methodName" id="method_name_select" class="slds-select" style="display: none;"></select>
			<span id="message_text" style="display: none;">{$MOD.NO_METHOD_AVAILABLE}</span>
		</td>
	</tr>
</table> 