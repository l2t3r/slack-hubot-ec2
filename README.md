# slack-hubot

slack-hubot is a chat bot built on the [Hubot][hubot] framework. It was initially generated by [generator-hubot][generator-hubot], and configured to be deployed on [Heroku][heroku] to get you up and running as quick as possible.

This README is intended to help get you started. Definitely update and improve to talk about your own instance, how to use and deploy, what functionality he has, etc!

[heroku]: http://www.heroku.com
[hubot]: http://hubot.github.com
[generator-hubot]: https://github.com/github/generator-hubot

### Running slack-hubot Locally

You can test your hubot by running the following.

You can start slack-hubot locally by running:

    % bin/hubot

You'll see some start up output about where your scripts come from and a
prompt:

    [Sun, 04 Dec 2011 18:41:11 GMT] INFO Loading adapter shell
    [Sun, 04 Dec 2011 18:41:11 GMT] INFO Loading scripts from /home/tomb/Development/hubot/scripts
    [Sun, 04 Dec 2011 18:41:11 GMT] INFO Loading scripts from /home/tomb/Development/hubot/src/scripts
    Hubot>

Then you can interact with slack-hubot by typing `slack-hubot help`.

    slack-hubot> slack-hubot help

    slack-hubot> animate me <query> - The same thing as `image me`, except adds a few
    convert me <expression> to <units> - Convert expression to given units.
    help - Displays all of the help commands that Hubot knows about.
    ...

### To run the hubot-slack-aws 
3 environment variables need to be exported before running [bin/hubot --adapter slack]

`HUBOT_SLACK_TOKEN=''`
`AWS_ACCESS_KEY_ID=''`
`AWS_SECRET_ACCESS_KEY=''`


### Scripting

An example script is included at `scripts/example.coffee`, so check it out to
get started, along with the [Scripting Guide](https://github.com/github/hubot/blob/master/docs/scripting.md).

For many common tasks, there's a good chance someone has already one to do just
the thing.

### hubot-scripts

There will inevitably be functionality that everyone will want. Instead
of writing it yourself, you can check
[hubot-scripts][hubot-scripts] for existing scripts.

To enable scripts from the hubot-scripts package, add the script name with
extension as a double quoted string to the `hubot-scripts.json` file in this
repo.

[hubot-scripts]: https://github.com/github/hubot-scripts

### external-scripts

Hubot is able to load scripts from third-party `npm` package. Check the package's documentation, but in general it is:

1. Add the packages as dependencies into your `package.json`
2. `npm install` to make sure those packages are installed
3. Add the package name to `external-scripts.json` as a double quoted string

You can review `external-scripts.json` to see what is included by default.


## Adapters

Adapters are the interface to the service you want your hubot to run on. This
can be something like Campfire or IRC. There are a number of third party
adapters that the community have contributed. Check
[Hubot Adapters][hubot-adapters] for the available ones.

If you would like to run a non-Campfire or shell adapter you will need to add
the adapter package as a dependency to the `package.json` file in the
`dependencies` section.

Once you've added the dependency and run `npm install` to install it you can
then run hubot with the adapter.

    % bin/hubot -a <adapter>

Where `<adapter>` is the name of your adapter without the `hubot-` prefix.

[hubot-adapters]: https://github.com/github/hubot/blob/master/docs/adapters.md

### Deploying to UNIX 
Please check out the [deploying hubot onto UNIX][deploy-unix]. 

[heroku-node-docs]: http://devcenter.heroku.com/articles/node-js
[deploy-unix]: https://github.com/github/hubot/blob/master/docs/deploying/unix.md



