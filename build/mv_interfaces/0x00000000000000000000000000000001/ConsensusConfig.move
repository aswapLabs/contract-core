module 0x1::ConsensusConfig {

    use 0x1::ConsensusConfig;

    struct ConsensusConfig has copy, drop, store {
        uncle_rate_target: u64,
        base_block_time_target: u64,
        base_reward_per_block: u128,
        base_reward_per_uncle_percent: u64,
        epoch_block_count: u64,
        base_block_difficulty_window: u64,
        min_block_time_target: u64,
        max_block_time_target: u64,
        base_max_uncles_per_block: u64,
        base_block_gas_limit: u64,
        strategy: u8,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun base_block_difficulty_window(a0: &ConsensusConfig::ConsensusConfig): u64;
    native public fun base_block_gas_limit(a0: &ConsensusConfig::ConsensusConfig): u64;
    native public fun base_block_time_target(a0: &ConsensusConfig::ConsensusConfig): u64;
    native public fun base_max_uncles_per_block(a0: &ConsensusConfig::ConsensusConfig): u64;
    native public fun base_reward_per_block(a0: &ConsensusConfig::ConsensusConfig): u128;
    native public fun base_reward_per_uncle_percent(a0: &ConsensusConfig::ConsensusConfig): u64;
    native public fun compute_reward_per_block(a0: u64): u128;
    native public fun do_compute_reward_per_block(a0: &ConsensusConfig::ConsensusConfig, a1: u64): u128;
    native public fun epoch_block_count(a0: &ConsensusConfig::ConsensusConfig): u64;
    native public fun get_config(): ConsensusConfig::ConsensusConfig;
    native public fun initialize(a0: &signer, a1: u64, a2: u64, a3: u64, a4: u64, a5: u128, a6: u64, a7: u64, a8: u64, a9: u64, a10: u64, a11: u8);
    native public fun max_block_time_target(a0: &ConsensusConfig::ConsensusConfig): u64;
    native public fun min_block_time_target(a0: &ConsensusConfig::ConsensusConfig): u64;
    native public fun new_consensus_config(a0: u64, a1: u64, a2: u128, a3: u64, a4: u64, a5: u64, a6: u64, a7: u64, a8: u64, a9: u64, a10: u8): ConsensusConfig::ConsensusConfig;
    native public fun strategy(a0: &ConsensusConfig::ConsensusConfig): u8;
    native public fun uncle_rate_target(a0: &ConsensusConfig::ConsensusConfig): u64;

}
