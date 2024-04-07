{** template-description:tmpl_grid **}
{if $separated_products}
    {foreach from=$separated_products item="products" key='subcategory'}
        {include file="common/subheader.tpl" title=$subcategories.$subcategory.category}
        {include file="blocks/list_templates/grid_list.tpl"
        show_name=true
        show_old_price=true
        show_price=true
        show_rating=true
        show_clean_price=true
        show_list_discount=true
        show_add_to_cart=$show_add_to_cart|default:true
        but_role="action"
        show_features=true
        show_product_labels=true
        show_discount_label=true
        show_shipping_label=true}
    {/foreach}
{else}
    {include file="blocks/list_templates/grid_list.tpl"
    show_name=true
    show_old_price=true
    show_price=true
    show_rating=true
    show_clean_price=true
    show_list_discount=true
    show_add_to_cart=$show_add_to_cart|default:true
    but_role="action"
    show_features=true
    show_product_labels=true
    show_discount_label=true
    show_shipping_label=true}
{/if}
