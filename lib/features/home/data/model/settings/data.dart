import 'email.dart';
import 'phone.dart';
import 'social_link.dart';
import 'website_icon.dart';
import 'website_logo.dart';
import 'website_logo192.dart';

class Data {
  String? updatedAt;
  String? websiteName;
  String? websiteUrl;
  String? metaTitle;
  String? metaDescription;
  String? metaKeywords;
  String? websiteBanerType;
  String? address;
  String? workTime;
  String? mapType;
  String? mapLink;
  String? mapContent;
  String? websiteAuthor;
  String? websiteAuthorName;
  String? authorWeb;
  String? authorPhone;
  String? authorEmail;
  String? authorAddress;
  String? loadGoogleFonts;
  String? googleFontFamily;
  String? loadFontawesome;
  String? loadMaterialIcons;
  String? loadStroke7Icons;
  String? loadJQuery;
  String? jQueryVersion;
  String? mainContentLayout;
  String? pageHeaderStyle;
  String? websiteTheme;
  String? pageHeaderFixed;
  String? brandPrimary;
  String? brandSecondary;
  String? bodyBg;
  String? bodyColor;
  String? bodyColorDark;
  String? headerBg;
  String? sidebarBg;
  String? loadAnimateCss;
  String? loadWowJs;
  String? loadOwlCarousel;
  String? websiteBaner;
  String? websiteBanerAbout;
  String? websiteBanerStory;
  String? websiteBanerGoles;
  List<Phone>? phone;
  List<Email>? email;
  dynamic accounts;
  String? isAllowLocalePicker;
  String? isAllowHeaderSearch;
  String? isAllowUserNav;
  String? isAllowHeader;
  String? isAllowHero;
  String? isAllowSidebar;
  String? isAllowIconShare;
  String? isAllowScrollCall;
  String? isAllowFloatingWhatsapp;
  String? isAllowScrollTop;
  String? isAllowLoader;
  String? isAllowSubscribe;
  String? isAllowUnsubscribe;
  String? isShowBtnPrivacy;
  String? isShowBtnDeleteaccount;
  String? isShowBtnBackend;
  String? isShowTagsType;
  String? isShowCategories;
  String? isShowCategoriesTree;
  WebsiteIcon? websiteIcon;
  WebsiteLogo? websiteLogo;
  dynamic websiteLogo128;
  WebsiteLogo192? websiteLogo192;
  List<SocialLink>? socialLinks;

  Data({
    this.updatedAt,
    this.websiteName,
    this.websiteUrl,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.websiteBanerType,
    this.address,
    this.workTime,
    this.mapType,
    this.mapLink,
    this.mapContent,
    this.websiteAuthor,
    this.websiteAuthorName,
    this.authorWeb,
    this.authorPhone,
    this.authorEmail,
    this.authorAddress,
    this.loadGoogleFonts,
    this.googleFontFamily,
    this.loadFontawesome,
    this.loadMaterialIcons,
    this.loadStroke7Icons,
    this.loadJQuery,
    this.jQueryVersion,
    this.mainContentLayout,
    this.pageHeaderStyle,
    this.websiteTheme,
    this.pageHeaderFixed,
    this.brandPrimary,
    this.brandSecondary,
    this.bodyBg,
    this.bodyColor,
    this.bodyColorDark,
    this.headerBg,
    this.sidebarBg,
    this.loadAnimateCss,
    this.loadWowJs,
    this.loadOwlCarousel,
    this.websiteBaner,
    this.websiteBanerAbout,
    this.websiteBanerStory,
    this.websiteBanerGoles,
    this.phone,
    this.email,
    this.accounts,
    this.isAllowLocalePicker,
    this.isAllowHeaderSearch,
    this.isAllowUserNav,
    this.isAllowHeader,
    this.isAllowHero,
    this.isAllowSidebar,
    this.isAllowIconShare,
    this.isAllowScrollCall,
    this.isAllowFloatingWhatsapp,
    this.isAllowScrollTop,
    this.isAllowLoader,
    this.isAllowSubscribe,
    this.isAllowUnsubscribe,
    this.isShowBtnPrivacy,
    this.isShowBtnDeleteaccount,
    this.isShowBtnBackend,
    this.isShowTagsType,
    this.isShowCategories,
    this.isShowCategoriesTree,
    this.websiteIcon,
    this.websiteLogo,
    this.websiteLogo128,
    this.websiteLogo192,
    this.socialLinks,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        updatedAt: json['updated_at'] as String?,
        websiteName: json['website_name'] as String?,
        websiteUrl: json['website_url'] as String?,
        metaTitle: json['meta_title'] as String?,
        metaDescription: json['meta_description'] as String?,
        metaKeywords: json['meta_keywords'] as String?,
        websiteBanerType: json['website_baner_type'] as String?,
        address: json['address'] as String?,
        workTime: json['work_time'] as String?,
        mapType: json['map_type'] as String?,
        mapLink: json['map_link'] as String?,
        mapContent: json['map_content'] as String?,
        websiteAuthor: json['website_author'] as String?,
        websiteAuthorName: json['website_author_name'] as String?,
        authorWeb: json['author_web'] as String?,
        authorPhone: json['author_phone'] as String?,
        authorEmail: json['author_email'] as String?,
        authorAddress: json['author_address'] as String?,
        loadGoogleFonts: json['load_google_fonts'] as String?,
        googleFontFamily: json['google_font_family'] as String?,
        loadFontawesome: json['load_fontawesome'] as String?,
        loadMaterialIcons: json['load_material_icons'] as String?,
        loadStroke7Icons: json['load_stroke7_icons'] as String?,
        loadJQuery: json['load_jQuery'] as String?,
        jQueryVersion: json['jQuery_version'] as String?,
        mainContentLayout: json['main_content_layout'] as String?,
        pageHeaderStyle: json['page_header_style'] as String?,
        websiteTheme: json['website_theme'] as String?,
        pageHeaderFixed: json['page_header_fixed'] as String?,
        brandPrimary: json['brand_primary'] as String?,
        brandSecondary: json['brand_secondary'] as String?,
        bodyBg: json['body_bg'] as String?,
        bodyColor: json['body_color'] as String?,
        bodyColorDark: json['body_color_dark'] as String?,
        headerBg: json['header_bg'] as String?,
        sidebarBg: json['sidebar_bg'] as String?,
        loadAnimateCss: json['load_animate_css'] as String?,
        loadWowJs: json['load_wow_js'] as String?,
        loadOwlCarousel: json['load_owl_carousel'] as String?,
        websiteBaner: json['website_baner'] as String?,
        websiteBanerAbout: json['website_baner_about'] as String?,
        websiteBanerStory: json['website_baner_story'] as String?,
        websiteBanerGoles: json['website_baner_goles'] as String?,
        phone: (json['phone'] as List<dynamic>?)
            ?.map((e) => Phone.fromJson(e as Map<String, dynamic>))
            .toList(),
        email: (json['email'] as List<dynamic>?)
            ?.map((e) => Email.fromJson(e as Map<String, dynamic>))
            .toList(),
        accounts: json['accounts'] as dynamic,
        isAllowLocalePicker: json['is_allow_locale_picker'] as String?,
        isAllowHeaderSearch: json['is_allow_header_search'] as String?,
        isAllowUserNav: json['is_allow_user_nav'] as String?,
        isAllowHeader: json['is_allow_header'] as String?,
        isAllowHero: json['is_allow_hero'] as String?,
        isAllowSidebar: json['is_allow_sidebar'] as String?,
        isAllowIconShare: json['is_allow_icon_share'] as String?,
        isAllowScrollCall: json['is_allow_scroll_call'] as String?,
        isAllowFloatingWhatsapp: json['is_allow_floating_whatsapp'] as String?,
        isAllowScrollTop: json['is_allow_scroll_top'] as String?,
        isAllowLoader: json['is_allow_loader'] as String?,
        isAllowSubscribe: json['is_allow_subscribe'] as String?,
        isAllowUnsubscribe: json['is_allow_unsubscribe'] as String?,
        isShowBtnPrivacy: json['is_show_btn_privacy'] as String?,
        isShowBtnDeleteaccount: json['is_show_btn_deleteaccount'] as String?,
        isShowBtnBackend: json['is_show_btn_backend'] as String?,
        isShowTagsType: json['is_show_tags_type'] as String?,
        isShowCategories: json['is_show_categories'] as String?,
        isShowCategoriesTree: json['is_show_categories_tree'] as String?,
        websiteIcon: json['website_icon'] == null
            ? null
            : WebsiteIcon.fromJson(
                json['website_icon'] as Map<String, dynamic>),
        websiteLogo: json['website_logo'] == null
            ? null
            : WebsiteLogo.fromJson(
                json['website_logo'] as Map<String, dynamic>),
        websiteLogo128: json['website_logo128'] as dynamic,
        websiteLogo192: json['website_logo192'] == null
            ? null
            : WebsiteLogo192.fromJson(
                json['website_logo192'] as Map<String, dynamic>),
        socialLinks: (json['social_links'] as List<dynamic>?)
            ?.map((e) => SocialLink.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'updated_at': updatedAt,
        'website_name': websiteName,
        'website_url': websiteUrl,
        'meta_title': metaTitle,
        'meta_description': metaDescription,
        'meta_keywords': metaKeywords,
        'website_baner_type': websiteBanerType,
        'address': address,
        'work_time': workTime,
        'map_type': mapType,
        'map_link': mapLink,
        'map_content': mapContent,
        'website_author': websiteAuthor,
        'website_author_name': websiteAuthorName,
        'author_web': authorWeb,
        'author_phone': authorPhone,
        'author_email': authorEmail,
        'author_address': authorAddress,
        'load_google_fonts': loadGoogleFonts,
        'google_font_family': googleFontFamily,
        'load_fontawesome': loadFontawesome,
        'load_material_icons': loadMaterialIcons,
        'load_stroke7_icons': loadStroke7Icons,
        'load_jQuery': loadJQuery,
        'jQuery_version': jQueryVersion,
        'main_content_layout': mainContentLayout,
        'page_header_style': pageHeaderStyle,
        'website_theme': websiteTheme,
        'page_header_fixed': pageHeaderFixed,
        'brand_primary': brandPrimary,
        'brand_secondary': brandSecondary,
        'body_bg': bodyBg,
        'body_color': bodyColor,
        'body_color_dark': bodyColorDark,
        'header_bg': headerBg,
        'sidebar_bg': sidebarBg,
        'load_animate_css': loadAnimateCss,
        'load_wow_js': loadWowJs,
        'load_owl_carousel': loadOwlCarousel,
        'website_baner': websiteBaner,
        'website_baner_about': websiteBanerAbout,
        'website_baner_story': websiteBanerStory,
        'website_baner_goles': websiteBanerGoles,
        'phone': phone?.map((e) => e.toJson()).toList(),
        'email': email?.map((e) => e.toJson()).toList(),
        'accounts': accounts,
        'is_allow_locale_picker': isAllowLocalePicker,
        'is_allow_header_search': isAllowHeaderSearch,
        'is_allow_user_nav': isAllowUserNav,
        'is_allow_header': isAllowHeader,
        'is_allow_hero': isAllowHero,
        'is_allow_sidebar': isAllowSidebar,
        'is_allow_icon_share': isAllowIconShare,
        'is_allow_scroll_call': isAllowScrollCall,
        'is_allow_floating_whatsapp': isAllowFloatingWhatsapp,
        'is_allow_scroll_top': isAllowScrollTop,
        'is_allow_loader': isAllowLoader,
        'is_allow_subscribe': isAllowSubscribe,
        'is_allow_unsubscribe': isAllowUnsubscribe,
        'is_show_btn_privacy': isShowBtnPrivacy,
        'is_show_btn_deleteaccount': isShowBtnDeleteaccount,
        'is_show_btn_backend': isShowBtnBackend,
        'is_show_tags_type': isShowTagsType,
        'is_show_categories': isShowCategories,
        'is_show_categories_tree': isShowCategoriesTree,
        'website_icon': websiteIcon?.toJson(),
        'website_logo': websiteLogo?.toJson(),
        'website_logo128': websiteLogo128,
        'website_logo192': websiteLogo192?.toJson(),
        'social_links': socialLinks?.map((e) => e.toJson()).toList(),
      };
}
