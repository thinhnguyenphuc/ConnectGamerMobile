import '../utils/games.dart';

class Strings {
  Strings._();

  static String appName = "Connect Gamer";
  static String demoApexInGame = "SBI_GSNKRYU";
  static String demoPUBGInGame = "GunzTBE";
  static String demoFortniteInGame = "Ship";

  static String serverAuthority = "203.167.9.213:5001";

  ///Both abbreviations and names must have the same order
  static List<String> supportGameAbbreviations = [
    "Fortnite"
    "PUBGPC",
    "Apex"
  ];
  static List<String> supportGameNames = [
    "Fortnite",
    "PUBG PC",
    "Apex"
  ];

  static List<String> supportGameIconsPath = [
    "assets/game_icons/fortnite.png",
    "assets/game_icons/pubg_pc.png",
    "assets/game_icons/apex.png",
  ];

  static List<String> attrPUBGDuoList = [
    GameUtils.WINS,
    GameUtils.LOSES,
    GameUtils.WINRATE,
    GameUtils.TOP10RATE,
    GameUtils.KILLS,
    GameUtils.HEADSHOTKILL,
    GameUtils.HEADSHOTRATE,
    GameUtils.LONGESTKILL,
    GameUtils.TOP10S
  ];

  static String lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  static List<String> testAvatar = [
    "https://answers.ea.com/t5/image/serverpage/image-id/59354iCE579B8AB988B339?v=v2",
    "https://answers.ea.com/t5/image/serverpage/image-id/59355i4808B28AF2614028?v=v2",
    "https://avatarfiles.alphacoders.com/174/thumb-174041.jpg",
    "https://preview.redd.it/b4wwv5gmjhm21.jpg?auto=webp&s=2d56e754675353a02cc593c8a443bc2ebe87899d",
    "https://i1.sndcdn.com/artworks-000521615898-yurm0x-t500x500.jpg",
    "https://i.pinimg.com/originals/90/cc/f6/90ccf6c8d905f2d40994d38f94ecdd43.jpg",
    "https://answers.ea.com/t5/image/serverpage/image-id/59356i97912F434F1FCEFE?v=v2",
    "https://coresos-phinf.pstatic.net/a/30f343/8_89eUd018svc15ieryol3he56_s1bsgx.jpg?type=s150",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRMdylbD-sC3z5sRvnv_v1fpIxnbiqFw5ISg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVuUoiD4idXMntt7hgiUZdQ4xNsB4oeuTUsA&usqp=CAU",
    "https://i1.sndcdn.com/artworks-000523859409-lzgi4k-t500x500.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxw703C-y_s2oXWp0YPQePthnBRPUhZEw-pg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd5vAbdUuTZ7eBrEVE2_sscp8xb-A3wd7DSQ&usqp=CAU",
    "https://1.bp.blogspot.com/-UEX9LngMkHs/XZgn5dlEzdI/AAAAAAAABTY/nIiJKamBkyo17eUr28a4SDirRqx6XxXaQCEwYBhgL/s1600/crypto-apex-legends-avatar.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQb9Ou5s_cRP_PPqkz_sNTQzKHCoZ1Hx8oydw&usqp=CAU",
    "https://assets.reedpopcdn.com/-1620565026788.jpg/BROK/thumbnail/1200x1200/quality/100/-1620565026788.jpg",
    "https://i.pinimg.com/originals/10/33/38/1033389808cd799314347260542f7cff.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRCfLu1OBMg2i89xbQDOPyGna5P2k_lJqshw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzC29S7FMhfVHwMD46O1DCIjZ6cs5vRibcfw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhPd_WZBbGYQ9oJmPWIM6lH8Gjs07POauMNg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdR2RBV_bJuKsR-vxorbkpLEUb3_HbtlBA8w&usqp=CAU"
  ];

  static String testUsername = "nnhuynh306";
  static String testToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoibm5odXluaDMwNiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyIjoibm5odXluaDMwNiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlVzZXIiLCJleHAiOjE2NTQ5MzA3MjQsImlzcyI6IkNvbm5lY3QgR2FtZXIifQ.mTEHPSTjNGKPu90Jxh25KNOuwVIXSUzQxPCvKlKkbsc";
}

class AssetPaths {
  AssetPaths._();

  static String errorLogo = "assets/images/logo/error_logo.png";
  static String logo = "assets/images/Logo.png";
  static String logoLight = "assets/images/logo/logo_black.png";
  static String logoDark = "assets/images/logo/logo_white.png";

  static String defaultPersonAvatar = "assets/images/default_avatar.jpg";

  static String noMessageIcon = "assets/images/no_message_icon.png";
}

class SignalRMethodNames {
  static String roomNameChanged = "RoomNameChange";
  static String editRoomAvatar = "";

  static String usersAddedToChatRoom = "NewUsersInRoom";
  static String usersRemovedFromChatRoom = "RemoveUsersInRoom";

  static String newMessage = "ReceiveMessage";

  static String newRoom = "NewRoom";

  static String userOnline = "UserOnline";
  static String userOffline = "UserOffline";

  static String receiveFriendRequest = "FriendRequest";
  static String friendRequestAccepted = "AcceptFriendRequest";
}
