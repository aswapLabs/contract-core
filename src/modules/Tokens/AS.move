address 0x0A7B8DAb322448AF454FccAfFBCbF247 {

module AS {


    use 0x1::Token;
    use 0x1::Account;


    struct AS has key, store {}

    const PRECISION: u8 = 9;

    // total supple 100 million
    const TOTAL_SUPPLY: u128 = 100000000 * 1000000000;

    const ERROR_NOT_GENESIS_ACCOUNT: u64 = 10001;
    const OUT_OF_MATKET_CAP: u64 = 10002;

    // initail AS token
    public fun init(account: signer) {
        Token::register_token<AS>(&account, PRECISION);

        mint(&account, TOTAL_SUPPLY);

        // remove and destroy burn_capability
        // to avoid burn AS token
        destroy_burn_capability(&account);

        // remove and destroy mint_capability
        // to avoid mint AS token again
        destroy_mint_capability(&account);
    }

    // mint and deposit as token, total minted TOTAL_SUPPLY
    fun mint(account: &signer, amount: u128) {

        // max mint amount less than or equal TOTAL_SUPPLY
        assert(amount <= TOTAL_SUPPLY, OUT_OF_MATKET_CAP);

        let token = Token::mint<AS>(account, amount);
        Account::deposit_to_self<AS>(account, token);
    }

    // remove and destroy burn_capability
    fun destroy_burn_capability(account: &signer) {
        let burn_capability = Token::remove_burn_capability<AS>(account);
        Token::destroy_burn_capability<AS>(burn_capability);
    }

    // remove and destroy mint_capability
    fun destroy_mint_capability(account: &signer) {
        let mint_capability = Token::remove_mint_capability<AS>(account);
        Token::destroy_mint_capability<AS>(mint_capability);
    }

    // is AS token
    public fun is_as_token<TokenType: store>(): bool {
        Token::is_same_token<AS, TokenType>()
    }

    // total supply
    public fun total_supply(): u128 {
        Token::market_cap<AS>()
    }
    
    // token as decimals
    public fun decimals(): u128 {
        Token::scaling_factor<AS>()
    }

    // get account ress
    public fun balance_of(addr: address): u128 {
        Account::balance<AS>(addr)
    }

    // get token owner address
    public fun token_address(): address {
        Token::token_address<AS>()
    }

    // do_accept_token
    public fun do_accept_token(account: signer) {
        Account::do_accept_token<AS>(&account);
    }

    
}
}