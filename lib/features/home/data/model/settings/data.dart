import '../../../../../core/data/models/email.dart';
import '../../../../../core/data/models/image.dart';
import '../../../../../core/data/models/phone.dart';
import 'social_link.dart';

class Setting {
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
  List<PhoneModel>? phone;
  List<EmailModel>? email;
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
  ImageModel? websiteIcon;
  ImageModel? websiteLogo;
  dynamic websiteLogo128;
  ImageModel? websiteLogo192;
  List<SocialLink>? socialLinks;

  Setting({
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

  factory Setting.fromJson(Map<String, dynamic> json) => Setting(
        updatedAt: json['updated_at'],
        websiteName: json['website_name'],
        websiteUrl: json['website_url'],
        metaTitle: json['meta_title'],
        metaDescription: json['meta_description'],
        metaKeywords: json['meta_keywords'],
        websiteBanerType: json['website_baner_type'],
        address: json['address'],
        workTime: json['work_time'],
        mapType: json['map_type'],
        mapLink: json['map_link'],
        mapContent: json['map_content'],
        websiteAuthor: json['website_author'],
        websiteAuthorName: json['website_author_name'],
        authorWeb: json['author_web'],
        authorPhone: json['author_phone'],
        authorEmail: json['author_email'],
        authorAddress: json['author_address'],
        loadGoogleFonts: json['load_google_fonts'],
        googleFontFamily: json['google_font_family'],
        loadFontawesome: json['load_fontawesome'],
        loadMaterialIcons: json['load_material_icons'],
        loadStroke7Icons: json['load_stroke7_icons'],
        loadJQuery: json['load_jQuery'],
        jQueryVersion: json['jQuery_version'],
        mainContentLayout: json['main_content_layout'],
        pageHeaderStyle: json['page_header_style'],
        websiteTheme: json['website_theme'],
        pageHeaderFixed: json['page_header_fixed'],
        brandPrimary: json['brand_primary'],
        brandSecondary: json['brand_secondary'],
        bodyBg: json['body_bg'],
        bodyColor: json['body_color'],
        bodyColorDark: json['body_color_dark'],
        headerBg: json['header_bg'],
        sidebarBg: json['sidebar_bg'],
        loadAnimateCss: json['load_animate_css'],
        loadWowJs: json['load_wow_js'],
        loadOwlCarousel: json['load_owl_carousel'],
        websiteBaner: json['website_baner'],
        websiteBanerAbout: json['website_baner_about'],
        websiteBanerStory: json['website_baner_story'],
        websiteBanerGoles: json['website_baner_goles'],
        phone: (json['phone'] as List<dynamic>?)
            ?.map((e) => PhoneModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        email: (json['email'] as List<dynamic>?)
            ?.map((e) => EmailModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        accounts: json['accounts'] as dynamic,
        isAllowLocalePicker: json['is_allow_locale_picker'],
        isAllowHeaderSearch: json['is_allow_header_search'],
        isAllowUserNav: json['is_allow_user_nav'],
        isAllowHeader: json['is_allow_header'],
        isAllowHero: json['is_allow_hero'],
        isAllowSidebar: json['is_allow_sidebar'],
        isAllowIconShare: json['is_allow_icon_share'],
        isAllowScrollCall: json['is_allow_scroll_call'],
        isAllowFloatingWhatsapp: json['is_allow_floating_whatsapp'],
        isAllowScrollTop: json['is_allow_scroll_top'],
        isAllowLoader: json['is_allow_loader'],
        isAllowSubscribe: json['is_allow_subscribe'],
        isAllowUnsubscribe: json['is_allow_unsubscribe'],
        isShowBtnPrivacy: json['is_show_btn_privacy'],
        isShowBtnDeleteaccount: json['is_show_btn_deleteaccount'],
        isShowBtnBackend: json['is_show_btn_backend'],
        isShowTagsType: json['is_show_tags_type'],
        isShowCategories: json['is_show_categories'],
        isShowCategoriesTree: json['is_show_categories_tree'],
        websiteIcon: json['website_icon'] == null
            ? null
            : ImageModel.fromJson(json['website_icon'] as Map<String, dynamic>),
        websiteLogo: json['website_logo'] == null
            ? null
            : ImageModel.fromJson(json['website_logo'] as Map<String, dynamic>),
        websiteLogo128: json['website_logo128'] as dynamic,
        websiteLogo192: json['website_logo192'] == null
            ? null
            : ImageModel.fromJson(
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
