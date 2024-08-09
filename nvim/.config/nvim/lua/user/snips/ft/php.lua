require("luasnip.session.snippet_collection").clear_snippets "php"

local ls = require "luasnip"

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local many_to_one = [[
    #[ORM\ManyToOne(targetEntity: {}::class)]
    #[ORM\JoinColumn(nullable: false)]
    #[SerializedName('{}')]
    #[Assert\NotNull]
    private {} ${};
]]

local one_to_many = [[
    /** @var Collection<int, {}> */
    #[ORM\OneToMany(targetEntity: {}::class, mappedBy: '{}', cascade: ['persist'], orphanRemoval: true)]
    #[SerializedName('{}')]
    #[Assert\All([new Assert\Type(type: {}::class)])]
    private Collection ${};
]]

local prop = [[
    #[ORM\Column(type: '{}')]
    #[SerializedName('{}')]
    #[Assert\NotNull]
    #[Assert\Type('{}')]
    #[Assert\Range(
        min: {},
        max: {},
        notInRangeMessage: '{}'
    )]
    private {} ${} = {};
]]

local getter = [[
    public function get{}(): {}
    {{
        return $this->{};
    }}
]]
local setter = [[
    public function set{}({} ${}): self
    {{
        $this->{} = ${};

        return $this;
    }}
]]
local gettersetter = [[
    public function get{}(): {}
    {{
        return $this->{};
    }}

    public function set{}({} ${}): self
    {{
        $this->{} = ${};

        return $this;
    }}
]]

local prop_gettersetter = [[
    #[ORM\ManyToOne(targetEntity: {}::class)]
    #[ORM\JoinColumn(nullable: false)]
    #[SerializedName('{}')]
    #[Assert\NotNull]
    private {} ${};

    public function get{}(): {}
    {{
        return $this->{};
    }}

    public function set{}({} ${}): self
    {{
        $this->{} = ${};

        return $this;
    }}
]]

local function camelcase(values)
  local name = values[1][1]
  name = name:gsub("(%l)(%w*)", function(a, b) return string.upper(a) .. b end)
  return name
end

ls.add_snippets("php", {
  s("phpstan", {
    t("//@phpstan-ignore-next-line")
  }),
  -- s("doc_v", fmt("/** @var {} {} */", i(1), i(2))),
  s("vd", fmt("var_dump({});", i(1))),
  s("mto", fmt(many_to_one, {
    i(1, "Class"), i(2, 'variable'), rep(1), rep(2)
  })),
  s("otm", fmt(one_to_many, {
    i(1, "Class"),
    rep(1),
    i(2, "fk"),
    i(3, "var"),
    rep(1),
    rep(3),
  })),
  s("prop", fmt(prop, {
    i(1, "integer"),
    i(2, 'variable'),
    rep(1),
    i(3, '1'), i(4, '100'),
    i(5, 'Menge muss zwischen {{ min }} und {{ max }} liegen'),
    i(6, 'int'),
    rep(2),
    i(7, '0'),
  })),
  s("getter", fmt(getter, { f(camelcase, { 2 }),
    i(1, 'type'),
    i(2, 'var'),
  })),
  s("setter", fmt(setter, {
    f(camelcase, { 2 }),
    i(1, 'type'),
    i(2, 'var'),
    rep(2),
    rep(2),
  })),
  s("gettersetter", fmt(gettersetter, {
    f(camelcase, { 2 }),
    i(1, 'type'),
    i(2, 'var'),
    f(camelcase, { 2 }),
    rep(1),
    rep(2),
    rep(2),
    rep(2),
  })),

  s("ns",
    fmt("namespace {}",
      f(function()
        local path = vim.fn.expand "%:p"
        return path
      end))),
})
