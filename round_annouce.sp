#include <sourcemod>
#include <sdktools>

public Plugin myinfo =
{
    name = "Round Start Message",
    author = "-R3d RuSh.",
    description = "Un plugin care arata un mesaj tip HTML si in chat cand incepe runda.",
    version = "1.0",
    url = "https://steamcommunity.com/id/r3drush/"
};

public void OnPluginStart()
{
    HookEvent("round_start", OnRoundStart);
}

public void OnRoundStart(Event event, const char[] name, bool dontBroadcast)
{
	if (GameRules_GetProp("m_bWarmupPeriod") == 1)
    {
        return;
    }

    PrintToChatAll("\x01*\x0CFACKRYGUNS \x01Iti ureaza \x04Succes la RUNDA!");

    Event newevent_message = CreateEvent("cs_win_panel_round");

    newevent_message.SetString("funfact_token", "<span class='fontSize-l'> \n --------------------------- \n <font color='#2AFF00'>Succes la RUNDA! \n <font color='#0027FF'>GO.FACKRYGUNS.RO \n <font color='#FFFFFF'>---------------------------");

    for (int z = 1; z <= MaxClients; z++)
    {
        if (IsClientInGame(z) && !IsFakeClient(z))
        {
            newevent_message.FireToClient(z);
        }
    }

    newevent_message.Cancel();
}