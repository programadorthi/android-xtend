package br.com.training.firstapp

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.view.ViewGroup
import android.widget.TextView

class DisplayMessageActivity extends AppCompatActivity {

    override onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_display_message)

        val message = intent.getStringExtra(MainActivity.EXTRA_MESSAGE)
        val textView = new TextView(this)
        textView.textSize = 40
        textView.text = message

        val layout = findViewById(R.id.activity_display_message) as ViewGroup
        layout.addView(textView)
    }
}