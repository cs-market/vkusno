{if $field == "group_id"}
    {assign var="elm_name" value="products_data[`$product.product_id`][`$field`]"}

    {if $product.product_id}
        {assign var="result_id" value="field_`$field`_`$product.product_id`_"}
    {else}
        {assign var="result_id" value="field_`$field`_0_"}
    {/if}
    <input type="hidden" name="{$elm_name}" id="{$result_id}" value="{$product.$field}" />
    {include file="common/ajax_select_object.tpl" data_url="product_groups.get_groups_list&status=A" text=$product.$field|fn_get_product_group_name result_elm=$result_id id="prod_`$product.product_id`"}
{/if}
