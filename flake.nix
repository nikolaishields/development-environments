{
  description = "A collection of flake templates";
  outputs = { self }: {
    templates = {
      trivial = {
        path = ./suse;
        description = "An experimental development environemt for SUSE projects";
      };
    };
    defaultTemplate = self.templates.trivial;
  };
}

