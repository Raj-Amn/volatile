return {
    s("main", fmt([[
    #include<iostream>
    #include<vector>
    using namespace std;

    int main(){{
        {}
    }}
    ]], {
        i(1)
    })),

    s("for", fmt([[
    for ({} = {}; {} < {}; {}++) {{
        {}
    }}
    ]], {
        i(1, "i"),
        i(2, "0"),
        f(function(args) return args[1][1] end, {1}),  -- mirrors i(1)
        i(3, "n"),
        f(function(args) return args[1][1] end, {1}),  -- mirrors i(1)
        i(4)
    })),

}
