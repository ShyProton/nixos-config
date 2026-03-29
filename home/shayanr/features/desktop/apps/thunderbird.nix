{
  accounts.email.accounts."shayanr" = {
    enable = true;
    primary = true;
    realName = "Shayan Rashid";
    flavor = "gmail.com";
    address = "shayanr1001@gmail.com";

    thunderbird = {
      enable = true;
    };
  };

  programs.thunderbird = {
    enable = true;
    profiles."shayanr" = {
      isDefault = true;
    };
  };
}
