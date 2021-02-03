class MemosController < ApplicationController

  def new
    @ticket = Ticket.find(params[:ticket_id])
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    @memo.ticket_id = params[:ticket_id]
    if @memo.save
      event = Event.new(
              description: "second event test",
              user: current_user,
              eventable: @memo,
              link: "memo"
              )
      event.save
      user_event = UserEvent.new(
              description: "second user event test",
              user: current_user,
              link: "memo"
              )
      user_event.save

      redirect_to ticket_path(params[:ticket_id])
    else
      render :new
    end
  end

  def edit
    @ticket = Ticket.find(params[:ticket_id])
    @memo = Memo.find(params[:id])
  end

# only owner can update it
  def update
    @memo = Memo.find(params[:id])
    if @memo.update(memo_params)
      redirect_to ticket_path(params[:ticket_id])
    else
      render :edit
    end

  end

  private

  def memo_params
    params.require(:memo).permit(:content)
  end
end




 # create_table "events", force: :cascade do |t|
 #    t.datetime "created_at", precision: 6, null: false
 #    t.datetime "updated_at", precision: 6, null: false
 #    t.string "eventable_type"
 #    t.bigint "eventable_id"
 #    t.bigint "user_id"
 #    t.string "description"
 #    t.string "link", default: ""
 #    t.index ["eventable_type", "eventable_id"], name: "index_events_on_eventable_type_and_eventable_id"
 #    t.index ["user_id"], name: "index_events_on_user_id"
 #  end

 #    create_table "user_events", force: :cascade do |t|
 #    t.text "description"
 #    t.bigint "user_id", null: false
 #    t.datetime "created_at", precision: 6, null: false
 #    t.datetime "updated_at", precision: 6, null: false
 #    t.string "link", default: ""
 #    t.index ["user_id"], name: "index_user_events_on_user_id"
 #  end
