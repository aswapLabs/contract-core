// SPDX-License-Identifier: GPL-3.0

address 0x0A7B8DAb322448AF454FccAfFBCbF247 {
module LiquidityToken {
    
    use 0x1::Token::{Self, Token};
    use 0x1::Account;

    // friend 0x0A7B8DAb322448AF454FccAfFBCbF247::Pair;

    struct LiquidityToken<TokenTypeX: store, TokenTypeY: store> has key, store {}

    // token's operation ability
    struct LiquidityTokenCapability<TokenTypeX: store, TokenTypeY: store> has key, store {
        mint: Token::MintCapability<LiquidityToken<TokenTypeX, TokenTypeY>>,
        burn: Token::BurnCapability<LiquidityToken<TokenTypeX, TokenTypeY>>,
    }

    /// precision of liquidity token
    const PRECISION: u8 = 9;

    /**
     * @dev initial pair token
     *
     * @TokenTypeX
     * @TokenTypeY
     */
    public fun register_liquidity_token<TokenTypeX: store, TokenTypeY: store>(account: &signer) {
        Token::register_token<LiquidityToken<TokenTypeX, TokenTypeY>>(account, PRECISION);
        Account::do_accept_token<LiquidityToken<TokenTypeX, TokenTypeY>>(account);

        let mint_capability = Token::remove_mint_capability<LiquidityToken<TokenTypeX, TokenTypeY>>(account);
        let burn_capability = Token::remove_burn_capability<LiquidityToken<TokenTypeX, TokenTypeY>>(account);

        let liquidity_token_capbility = LiquidityTokenCapability{
            mint: mint_capability,
            burn: burn_capability
        };

        move_to<LiquidityTokenCapability<TokenTypeX, TokenTypeY>>(account, liquidity_token_capbility);
    }

    /**
     * dev mint swap pair token
     * 
     * TokenTypeX
     */
    public fun mint<TokenTypeX: store, TokenTypeY: store>(
        addr: address,
        amount: u128
    ): Token<LiquidityToken<TokenTypeX, TokenTypeY>> 
    acquires LiquidityTokenCapability {
        let liquidity_token_capbility = borrow_global_mut<LiquidityTokenCapability<TokenTypeX, TokenTypeY>>(addr);
        let mint_capability = &liquidity_token_capbility.mint;

        let token = Token::mint_with_capability<LiquidityToken<TokenTypeX, TokenTypeY>>(mint_capability, amount);
        token
    }

    /**
     * dev burn swap pair token
     * 
     * TokenType
     *  public fun burn<TokenType: store>(account: &signer, tokens: Token<TokenType>)
     */
    public fun burn<TokenTypeX: store, TokenTypeY: store>(
        addr: address,
        token: Token::Token<LiquidityToken<TokenTypeX, TokenTypeY>>
    ) acquires LiquidityTokenCapability {
        let liquidity_token_capbility = borrow_global_mut<LiquidityTokenCapability<TokenTypeX, TokenTypeY>>(addr);
        let burn_capability = &liquidity_token_capbility.burn;
        Token::burn_with_capability<LiquidityToken<TokenTypeX, TokenTypeY>>(burn_capability, token)
    }

    // liquidity token exists in sender 
    public fun liquidity_token_exists<TokenTypeX: store, TokenTypeY: store>(addr: address): bool {

        Token::is_registered_in<LiquidityToken<TokenTypeX, TokenTypeY>>(addr)
    }

    //get liquidity token address
    public fun token_address<TokenTypeX: store, TokenTypeY: store>(): address {
        Token::token_address<LiquidityToken<TokenTypeX, TokenTypeY>>()
    }

    // mint liquidity tokens via capbilidty
    public fun  mint_with_capability<TokenTypeX: store, TokenTypeY: store>(
        addr: address,
        amount: u128
    ) : Token::Token<LiquidityToken<TokenTypeX, TokenTypeY>>
        acquires LiquidityTokenCapability {
        let liquidity_cap = borrow_global<LiquidityTokenCapability<TokenTypeX, TokenTypeY>>(addr);
        Token::mint_with_capability<LiquidityToken<TokenTypeX, TokenTypeY>>(&liquidity_cap.mint, amount)
        //mint_token
    } 

    // burn liquidity tokens via capbilidty
    public fun burn_with_capability<TokenTypeX: store, TokenTypeY: store>(
        addr: address,
        token: Token::Token<LiquidityToken<TokenTypeX, TokenTypeY>> 
    ) acquires LiquidityTokenCapability {
        let liquidity_cap = borrow_global<LiquidityTokenCapability<TokenTypeX, TokenTypeY>>(addr);
        Token::burn_with_capability<LiquidityToken<TokenTypeX, TokenTypeY>>(&liquidity_cap.burn, token)
    }


}
}