address 0x0A7B8DAb322448AF454FccAfFBCbF247 {

module UNI {
    use 0x1::Token;
    use 0x1::Account;
    use 0x1::Debug;
    use 0x1::Signer;


    // token name
    struct UNI has copy, drop, store  {}

    // 10 ** 9
    const PRECISION: u8 = 9;

    const ERROR_NOT_GENESIS_ACCOUNT: u64 = 10001;

    // initial token info and mint token
    public(script) fun init(account: signer) {
        Token::register_token<UNI>(&account, PRECISION);
        Account::do_accept_token<UNI>(&account);
        mint(&account, 100000000000000000);
    }
    // mint token to my self
    public fun mint(account: &signer, amount: u128) {
        let token = Token::mint<UNI>(account, amount);
        Account::deposit_to_self<UNI>(account, token);
    }


    public(script) fun init1(account: signer) {
        //Token::register_token<UNI>(&account, PRECISION);
        //Account::do_accept_token<UNI>(&account);
        mint(&account, 100000000000000000);
        let num =   Account::balance<UNI>(Signer::address_of(&account));
        Debug::print(&num);
    }

     public(script) fun get_my_balance(account: signer) {
        let num =   Account::balance<UNI>(Signer::address_of(&account));
        Debug::print(&num);
    }


   
    public fun is_token2<TokenType: store>(): bool {
        Token::is_same_token<UNI, TokenType>()
    }

    public(script) fun test() {}

    
}
}