<div class="ip5_wishlist cm-reload-{$obj_id}" id="wish_list_{$obj_id}">

    {assign var="wishlist_products" value=$smarty.session.wishlist.products}
    {assign var="in_wishlist_flag" value=false}

    {foreach from=$wishlist_products item="item" name=cproducts}
        {if $item.product_id == $obj_id}
            {assign var="in_wishlist_flag" value=true}
        {/if}
    {/foreach}

{$wishlist_button_type = $wishlist_button_type|default:  "icon"}
{$but_id               = $wishlist_but_id|default:       $but_id}
{$but_name             = $wishlist_but_name|default:     $but_name}
{$but_title            = $wishlist_but_title|default:    __("add_to_wishlist")}
{$but_role             = $wishlist_but_role|default:     "text"}
{$but_onclick          = $wishlist_but_onclick|default:  $but_onclick}
{$but_href             = $wishlist_but_href|default:     $but_href}

{if $wishlist_button_type == "icon"}
    {$but_icon         = $wishlist_but_icon|default:     "ty-icon-heart"}
    {$but_text         = $wishlist_but_text|default:     false}
    {$but_meta         = $wishlist_but_meta|default:     "ty-btn__tertiary ty-btn-icon ty-add-to-wish"}
{else}
    {$but_icon         = ($wishlist_but_icon === true) ? "ty-icon-heart" : $wishlist_but_icon}
    {$but_text         = $wishlist_but_text|default:     __("add_to_wishlist")}
    {$but_meta         = $wishlist_but_meta|default:     "ty-btn__text ty-add-to-wish"}
{/if}

{include file="buttons/button.tpl"
but_id=$but_id
but_meta="ty-btn__text ty-add-to-wish {if $in_wishlist_flag == true} has_inwishlist {/if}"
but_name=$but_name
but_text=$but_text
but_title=$but_title
but_role=$but_role
but_onclick=$but_onclick
but_href=$but_href
but_icon=$but_icon
}
    <!--wish_list_{$obj_id}--></div>
