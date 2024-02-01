{** block-description:ip5_tmpl_logo_mobile **}
{if $runtime.controller == "index"}
    <div class="ty-logo-container">
        <img src="{$self_images_dir}/logo_mobile.svg" class="ty-logo-container__image" alt="{$logos.theme.image.alt}" />
    </div>
{else}
    {$logo_link = $block.properties.enable_link|default:"Y" == "Y"}
    <div class="ty-logo-container">
        {if $logo_link}
            <a href="{""|fn_url}" title="{$logos.theme.image.alt}">
                {/if}
            <img src="{$self_images_dir}/logo_mobile.svg" class="ty-logo-container__image" alt="{$logos.theme.image.alt}" />
            {if $logo_link}
        </a>
        {/if}
    </div>
{/if}

