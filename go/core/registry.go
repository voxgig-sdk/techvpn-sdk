package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewServerEntityFunc func(client *TechvpnSDK, entopts map[string]any) TechvpnEntity

