{if $banner.type == "IP5BannerTypes::IP5_GRAPHIC"|enum}
	{__("ip5_banner.type.graphic")}
{elseif $banner.type == "IP5BannerTypes::IP5_VIDEO"|enum}
	{__("ip5_banner.type.video")}
{elseif $banner.type == "IP5BannerTypes::GRAPHIC"|enum}
	{__("graphic_banner")}
{else}
	{__("text_banner")}
{/if}