{** block-description:tmpl_ip5_top_user_buttons **}

<div class="ip5_orders">
    <img src="{$self_images_dir}/orders.svg" class="ty-orders-img" alt=""/>
    {if $auth.user_id}
        <a href="{"orders.search"|fn_url}" rel="nofollow">{__("orders")}</a>
    {else}
       <a href="{"auth.login_form"|fn_url}" rel="nofollow">{__("orders")}</a>
    {/if}
</div>


{if $addons.wishlist.status == "A" && !$hide_wishlist_button}
    {$wishlist_count = "fn_wishlist_get_count"|call_user_func}
    <div class="ip5-wishlist-count" id="wish_list_count">

        <a class="{if !$runtime.customization_mode.live_editor}cm-tooltip{/if} ip5__wishlist__a {if $wishlist_count > 0}active{/if}"
           href="{"wishlist.view"|fn_url}" rel="nofollow">
            <span class="title_img">
                 <img src="{$self_images_dir}/wishlist.svg" class="ty-wishlist-img" alt=""/>
                 {if $wishlist_count > 0}
                     <span class="count">{$wishlist_count}</span>
                 {/if}
            </span>
            <span>{__("wishlist")}</span>

        </a>
        <!--wish_list_count--></div>
{/if}






