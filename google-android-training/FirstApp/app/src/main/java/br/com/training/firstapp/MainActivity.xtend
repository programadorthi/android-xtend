package br.com.training.firstapp

import android.content.Intent
import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.view.View
import android.widget.EditText

class MainActivity extends AppCompatActivity {

    public val static EXTRA_MESSAGE = "com.example.myfirstapp.MESSAGE"

    override onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    def sendMessage(View view) {
        val intent = new Intent(this, typeof(DisplayMessageActivity))
        val editText = findViewById(R.id.edit_message) as EditText
        val message = editText.text.toString
        intent.putExtra(EXTRA_MESSAGE, message)
        startActivity(intent)
    }

}