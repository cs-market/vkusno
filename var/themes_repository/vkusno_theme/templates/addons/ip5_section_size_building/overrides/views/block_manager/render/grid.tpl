{if $runtime.customization_mode.block_manager && $location_data.is_frontend_editing_allowed}
    {include file="backend:views/block_manager/frontend_render/grid.tpl"}
{else}
    {if $layout_data.layout_width != "fixed"}
        {if $parent_grid.width > 0}
            {$fluid_width = fn_get_grid_fluid_width($layout_data.width, $parent_grid.width, $grid.width)}
        {else}
            {$fluid_width = $grid.width}
        {/if}
    {/if}

    {if $grid.status == "A" && $content}


        {if !$grid.parent_id}
            {if $grid.alpha}
                <div class="container-fluid-row{if $grid.extended == "E"} container-fluid-row-bg-limit{/if}{if $grid.extended == "F"} container-fluid-row-unlimit{/if}{if $grid.user_class} uc-{$grid.user_class}{/if}">
            {/if}
        {/if}

        {if $grid.alpha}
            <div class="{if $layout_data.layout_width != "fixed"}row-fluid {else}row{/if}">
        {/if}
            {$width = $fluid_width|default:$grid.width}
                <div class="span{$width}{if $grid.offset} offset{$grid.offset}{/if} {$grid.user_class}">
                    {if $grid.wrapper}
                        {include file=$grid.wrapper content=$content}
                    {else}
                        {$content nofilter}
                    {/if}
                </div>
        {if $grid.omega}
            </div>
        {/if}

        {if !$grid.parent_id}
            {if $grid.omega}</div>{/if}
        {/if}


    {/if}
{/if}



