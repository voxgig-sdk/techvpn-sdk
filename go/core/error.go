package core

type TechvpnError struct {
	IsTechvpnError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewTechvpnError(code string, msg string, ctx *Context) *TechvpnError {
	return &TechvpnError{
		IsTechvpnError: true,
		Sdk:              "Techvpn",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *TechvpnError) Error() string {
	return e.Msg
}
