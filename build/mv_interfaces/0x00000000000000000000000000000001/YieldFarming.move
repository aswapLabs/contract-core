module 0x1::YieldFarming {

    use 0x1::Token;
    use 0x1::YieldFarming;

    struct Exp has copy, drop, store {
        mantissa: u128,
    }
    struct Farming<T0, T1> has store, key {
        treasury_token: Token::Token<T1>,
    }
    struct FarmingAsset<T0, T1> has store, key {
        asset_total_weight: u128,
        harvest_index: u128,
        last_update_timestamp: u64,
        release_per_second: u128,
        start_time: u64,
    }
    struct ParameterModifyCapability<T0, T1> has store, key {
        dummy_field: bool,
    }
    struct Stake<T0, T1> has store, key {
        asset: T1,
        asset_weight: u128,
        last_harvest_index: u128,
        gain: u128,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun calculate_harvest_index(a0: u128, a1: u128, a2: u64, a3: u64, a4: u128): u128;
    native public fun calculate_harvest_index_weight_zero(a0: u128, a1: u64, a2: u64, a3: u128): u128;
    native public fun calculate_withdraw_amount(a0: u128, a1: u128, a2: u128): u128;
    native public fun exists_asset_at<T0: store, T1: store>(a0: address): bool;
    native public fun exists_at<T0: store, T1: store>(a0: address): bool;
    native public fun exists_stake_at_address<T0: store, T1: store>(a0: address): bool;
    native public fun harvest<T0: store, T1: store, T2: store>(a0: &signer, a1: address, a2: u128): Token::Token<T1>;
    native public fun initialize<T0: store, T1: store>(a0: &signer, a1: Token::Token<T1>);
    native public fun initialize_asset<T0: store, T1: store>(a0: &signer, a1: u128, a2: u64): YieldFarming::ParameterModifyCapability<T0, T1>;
    native public fun modify_parameter<T0: store, T1: store, T2: store>(a0: &YieldFarming::ParameterModifyCapability<T0, T2>, a1: address, a2: u128);
    native public fun query_gov_token_amount<T0: store, T1: store, T2: store>(a0: &signer, a1: address): u128;
    native public fun query_stake<T0: store, T1: store>(a0: &signer): u128;
    native public fun query_total_stake<T0: store, T1: store>(a0: address): u128;
    native public fun stake<T0: store, T1: store, T2: store>(a0: &signer, a1: address, a2: T2, a3: u128);
    native public fun unstake<T0: store, T1: store, T2: store>(a0: &signer, a1: address): (T2, Token::Token<T1>);

}
