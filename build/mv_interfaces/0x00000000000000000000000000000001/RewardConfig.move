module 0x1::RewardConfig {

    use 0x1::RewardConfig;

    struct RewardConfig has copy, drop, store {
        reward_delay: u64,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun get_reward_config(): RewardConfig::RewardConfig;
    native public fun initialize(a0: &signer, a1: u64);
    native public fun new_reward_config(a0: u64): RewardConfig::RewardConfig;
    native public fun reward_delay(): u64;

}
