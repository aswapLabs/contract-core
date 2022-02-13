address 0x0A7B8DAb322448AF454FccAfFBCbF247 {

module TokenAA1 {
    use 0x1::Token;
    use 0x1::Account;
    use 0x1::Signer;
    use 0x1::Debug;


    struct TokenAA1 has key, store {}

    const PRECISION: u8 = 9;

    const ERROR_NOT_GENESIS_ACCOUNT: u64 = 10001;

    public fun init(account: signer) {
        Token::register_token<TokenAA1>(&account, PRECISION);
        Account::do_accept_token<TokenAA1>(&account);
        mint(&account, 10000000000000);
    }

    public fun init_cli(account: &signer) {
        Token::register_token<TokenAA1>(account, PRECISION);
        Account::do_accept_token<TokenAA1>(account);
        mint(account, 10000000000000);
    }

    public(script) fun do_init(account: signer) {
        init(account);
    } 

    public(script) fun get_balance(account: signer): u128 {
        let num = Account::balance<TokenAA1>(Signer::address_of(&account));
        Debug::print(&num);
        num
    }

    public fun get_balance_cli(account: &signer): u128 {
        Account::balance<TokenAA1>(Signer::address_of(account))
    }

    fun mint(account: &signer, amount: u128) {
        let token = Token::mint<TokenAA1>(account, amount);
        Account::deposit_to_self<TokenAA1>(account, token);
    }

    public(script) fun mint_token(account: signer, amount: u128) {
        let token = Token::mint<TokenAA1>(&account, amount);
        Account::deposit_to_self<TokenAA1>(&account, token);
    }



    public fun is_token1<TokenType: store>(): bool {
        Token::is_same_token<TokenAA1, TokenType>()
    }

    
}
}