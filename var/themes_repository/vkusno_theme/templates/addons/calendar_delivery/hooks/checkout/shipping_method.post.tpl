{if $cart.chosen_shipping.$group_key == $shipping.shipping_id && $shipping.module == 'calendar_delivery'}
<div class="litecheckout__container">
    <div class="litecheckout__item">
        <div class="ip5_delivery_time">
            <img alt="" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggb3BhY2l0eT0iMC41IiBkPSJNMTIgMjEuOTk5OUMxNi44MzYyIDIxLjk5OTkgMjAuNzU2NyAxOC4xMTYyIDIwLjc1NjcgMTMuMzI1M0MyMC43NTY3IDguNTM0NDEgMTYuODM2MiA0LjY1MDYzIDEyIDQuNjUwNjNDNy4xNjM4NCA0LjY1MDYzIDMuMjQzMzUgOC41MzQ0MSAzLjI0MzM1IDEzLjMyNTNDMy4yNDMzNSAxOC4xMTYyIDcuMTYzODQgMjEuOTk5OSAxMiAyMS45OTk5WiIgZmlsbD0id2hpdGUiLz4KPHBhdGggZD0iTTExLjk5OTcgOC43NDcwN0MxMi40MDI4IDguNzQ3MDcgMTIuNzI5NSA5LjA3MDcyIDEyLjcyOTUgOS40Njk5NlYxMy4wMjU5TDE0Ljk0ODEgMTUuMjIzOEMxNS4yMzMxIDE1LjUwNjEgMTUuMjMzMSAxNS45NjM4IDE0Ljk0ODEgMTYuMjQ2MUMxNC42NjMyIDE2LjUyODUgMTQuMjAxMSAxNi41Mjg1IDEzLjkxNjIgMTYuMjQ2MUwxMS40ODM4IDEzLjgzNjVDMTEuMzQ2OSAxMy43MDEgMTEuMjcgMTMuNTE3MSAxMS4yNyAxMy4zMjU0VjkuNDY5OTZDMTEuMjcgOS4wNzA3MiAxMS41OTY3IDguNzQ3MDcgMTEuOTk5NyA4Ljc0NzA3WiIgZmlsbD0id2hpdGUiLz4KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik04LjI0MDUgMi4zMzk4NkM4LjQ1NDA5IDIuNjc4NDEgOC4zNTAyIDMuMTI0NCA4LjAwODQ0IDMuMzM1OTlMNC4xMTY1NyA1Ljc0NTYyQzMuNzc0ODEgNS45NTcyMiAzLjMyNDYxIDUuODU0MyAzLjExMTAyIDUuNTE1NzRDMi44OTc0MiA1LjE3NzE4IDMuMDAxMzEgNC43MzEyIDMuMzQzMDcgNC41MTk2TDcuMjM0OTQgMi4xMDk5OEM3LjU3NjcgMS44OTgzOCA4LjAyNjkgMi4wMDEzIDguMjQwNSAyLjMzOTg2WiIgZmlsbD0id2hpdGUiLz4KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik0xNS43NTk1IDIuMzM5ODVDMTUuOTczMSAyLjAwMTMgMTYuNDIzMyAxLjg5ODM4IDE2Ljc2NTEgMi4xMDk5OEwyMC42NTY5IDQuNTE5NkMyMC45OTg3IDQuNzMxMiAyMS4xMDI2IDUuMTc3MTkgMjAuODg5IDUuNTE1NzRDMjAuNjc1NCA1Ljg1NDMgMjAuMjI1MiA1Ljk1NzIyIDE5Ljg4MzQgNS43NDU2MkwxNS45OTE2IDMuMzM1OTlDMTUuNjQ5OCAzLjEyNDQgMTUuNTQ1OSAyLjY3ODQxIDE1Ljc1OTUgMi4zMzk4NVoiIGZpbGw9IndoaXRlIi8+Cjwvc3ZnPgo=">
            <span>{__("ip5_theme_addon.delivery_time")}</span>
        </div>
    </div>
    <div class="litecheckout__item">
        {$min_date = "+{$shipping.service_params.nearest_delivery_day}"}
        {$default = "+{$shipping.service_params.nearest_delivery_day} day"|strtotime}

        {include file="addons/calendar_delivery/components/calendar.tpl" date_id="delivery_date_`$group_key`_`$shipping.shipping_id`" date_name="delivery_date[`$group_key`]" date_val = $group.delivery_date|default:$default|fn_parse_date min_date=$min_date max_date="+5" service_params=$shipping.service_params extra='readonly="_readonly"'}
        {include
            file="addons/calendar_delivery/components/period.tpl"
            date_id="delivery_period_`$group_key`_`$shipping.shipping_id`"
            datapicker_id="delivery_date_`$group_key`_`$shipping.shipping_id`"
            date_name="delivery_period[`$group_key`]"
            date_val = $cart.delivery_period.$group_key
            period_start = $shipping.service_params.period_start
            period_finish = $shipping.service_params.period_finish
            period_step = $shipping.service_params.period_step
        }
    </div>
    {if $shipping.service_params.offer_documents == "YesNo::YES"|enum}
    <div class="litecheckout__item">
        <div class="litecheckout__terms" id="litecheckout_terms">
            <div class="ty-control-group ty-checkout__terms">
                <div class="cm-field-container">
                    <input type="hidden" name="documents_originals[{$group_key}]" value="N">
                    <label for="documents_originals_{$group_key}" class="cm-check-agreement"><input type="checkbox" id="documents_originals_{$group_key}" name="documents_originals[{$group_key}]" value="Y" class="checkbox" {if $shipping.service_params.offer_documents_checked == "YesNo::YES"|enum}checked="_checked"{/if}>{__('calendar_delivery.documents_originals')}</label>
                </div>
            </div>
        </div>
    </div>
    {/if}
</div>
{/if}
